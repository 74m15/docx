# -*- coding: utf-8 -*-
"""
Created on Wed Feb 22 00:03:20 2017

@author: pasquale.capuano@gmail.com
"""

from bottle import Bottle, run, template, static_file, request
from uuid import uuid1
import subprocess

app = Bottle()

@app.get("/")
def home():
  return template("www/home.html")

@app.get("/docs/<path:path>")
def get_docs(path):
  return static_file(path, root='work/document/')
  
@app.post("/upload")
def do_upload():
  xlsx = request.files.get("xlsx")
  db   = request.files.get("db")
  docx = request.files.get("docx")
  
  in_id = str(uuid1())
  out_id = str(uuid1())
  
  if (xlsx):
    xlsx.save("work/database/{0}.xlsx".format(in_id))
  
  if (db):
    db.save("work/database/{0}.xml".format(in_id))
    
  if (docx):
    docx.save("work/document/{0}.docx".format(in_id))
  
  args = [
    "process.bat", 
    "-in", "{0}.docx".format(in_id),
    "-db", "{0}.xml".format(in_id), 
    "-out", "{0}.docx".format(out_id),
    "-log", "1"]

  try:  
    proc = subprocess.Popen(args, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
  except:
    args[0] = "./process.sh"

    proc = subprocess.Popen(args, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
  
  result = proc.communicate()
  
  return template("www/uploaded.html", target="{0}.docx".format(out_id), out=result[0], err=result[1])

run(app, host="0.0.0.0", port=8080, debug=True)
