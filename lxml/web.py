# -*- coding: utf-8 -*-
"""
Created on Wed Feb 22 00:03:20 2017

@author: pasquale.capuano@gmail.com
"""

from bottle import Bottle, run, template, static_file, request
from uuid import uuid1
from platform import system
import subprocess
import os.path

app = Bottle()

def defaultValue(f, d):
  if (f is None or len(f) == 0):
    return d
  else:
    return f

@app.get("/")
def home():
  return template("www/home.html")

@app.get("/docs/<path:path>")
def get_docs(path):
  return static_file(path, root='work/document/')

@app.get("/database/<path:path>")
def get_db(path):
  return static_file(path, root='work/database/')
  
@app.post("/upload")
def do_upload():
  xlsx  = request.files.get("xlsx")
  db    = request.files.get("db")
  docx  = request.files.get("docx")
  log   = str(defaultValue(request.forms.get("log"), "1"))
  dummy = bool(defaultValue(request.forms.get("dummy"),0))
  
  print("Dummy: ", request.forms.get("dummy"), dummy)
  
  in_id = str(uuid1())
  out_id = str(uuid1())
  
  db_out = None
  doc_out = None
  
  if (xlsx):
    xlsx.save(os.path.join("work","database", "{0}.xlsx".format(in_id)))
  
  if (db):
    db.save(os.path.join("work", "database", "{0}.xml".format(in_id)))
    
  if (docx):
    docx.save(os.path.join("work", "document", "{0}.docx".format(in_id)))
  
  
  if (xlsx and docx):
    process_string = "docx.bat" if system() == "Windows" else "./docx.sh"
    
    args = [
      process_string, 
      "-doc", "{0}.docx".format(in_id),
      "-db", "{0}.xlsx".format(in_id), 
      "-out", "{0}.docx".format(out_id),
      "-log", log]
    
    if (dummy):
      args.append("-dummy")
    
    proc = subprocess.Popen(args, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    proc_out = proc.communicate()
    
    doc_out = { "output" : "{0}.docx".format(out_id), "stdout" : proc_out[0], "stderr" : proc_out[1] }
    
  elif (xlsx):
    process_string = "prepare-db.bat" if system() == "Windows" else "./prepare-db.sh"
    
    args = [
      process_string, 
      "-in", "{0}.xlsx".format(in_id),
      "-out", "{0}.xml".format(out_id),
      "-log", log]
      
    proc = subprocess.Popen(args, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    proc_out = proc.communicate()
    
    db_out = { "output" : "{0}.xml".format(out_id), "stdout" : proc_out[0], "stderr" : proc_out[1] }
    
  elif (db and docx):
    process_string = "process.bat" if system() == "Windows" else "./process.sh"
    
    args = [
      process_string, 
      "-in", "{0}.docx".format(in_id),
      "-db", "{0}.xml".format(in_id), 
      "-out", "{0}.docx".format(out_id),
      "-log", log]
    
    if (dummy):
      args.append("-dummy")
    
    proc = subprocess.Popen(args, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    proc_out = proc.communicate()
    
    doc_out = { "output" : "{0}.docx".format(out_id), "stdout" : proc_out[0], "stderr" : proc_out[1] }
  
  return template("www/uploaded.html", db=db_out, doc=doc_out)

run(app, host="0.0.0.0", port=8080, debug=True)
