# -*- coding: utf-8 -*-
"""
Created on Wed Aug 17 11:36:28 2016

@author: CAPUANO-P
"""

import sys
from argparse import ArgumentParser
from lxml import etree


class MyExtElement(etree.XSLTExtension):
  def __init__(self):
    print("Initializing...!")
    super(etree.XSLTExtension, self).__init__()
    
    self.cache = list()
  
  def get_only_text(self, element):
    if (len(element) == 0):
      return str(element.text)
    else:
      return "".join([self.get_only_text(child) for child in element])
    
    
  def execute(self, context, self_node, input_node, output_parent):
    try:
      res = self.process_children(context, elements_only=False, remove_blank_text=True)
      
      for element in res:
        self.cache.append(self.get_only_text(element))
    except Exception as ex:
      print("execute(...) raised an exception: {0}".format(ex))
  
  def get_cache(self, context, idx):
    try:
      return self.cache[int(idx)]
    except:
      print("cache[{0}]".format(int(idx)))
      
      return self.cache[int(idx)]

def getOutputFile(out):
    if (isinstance(out, str)):
        return open(out, "wb")
    else:
        return out

def getParams(p):
    params = dict()
    
    if (not p):
        return params
        
    if (not isinstance(p, list)):
        p = [p]
        
    for item in p:
        eq = item.find("=")
        
        params[item[:eq]] = item[eq+1:]
        
    return params
    
if (__name__ == "__main__"):
    parser = ArgumentParser("XSLT processor")
    
    parser.add_argument("-in",  help="XML input file", type=str, dest="in", required=True)
    parser.add_argument("-xsl", help="XSLT stylesheet file to process", type=str, dest="xsl", required=True)
    parser.add_argument("-out", help="Output stream", type=str, dest="out", required=True)
    parser.add_argument("-p", "--param", help="XSL parameter (format \"name=value\")", action='append', type=str, dest="params")
    parser.add_argument("-v", "--verbose", help="Print verbose output", action="store_true" , dest="verbose")
    
    opts = vars(parser.parse_args())
    
    args_in = opts["in"]
    args_xsl = opts["xsl"]
    args_out = getOutputFile(opts["out"])
    args_params = getParams(opts["params"])
    
    if (opts["verbose"]):
      print("in:\t%s" % args_in)
      print("xsl:\t%s" % args_xsl)
      print("out:\t%s" % args_out)
      print("p:\t%s" % args_params)
      print()

    # step 1: read XML input file
    
    # step 1.1: open the input file
    xml_file = open(args_in,"rb")
    
    #step 1.2: read the input file
    xml = etree.parse(xml_file)
    
    # step 2: read XSLT input file
    
    # step 2.1: open the input file
    xslt_file = open(args_xsl,"rb")
    
    # step 2.2: prepare XPath/XSLT extensions
    my_ext = MyExtElement()
    extensions = { ('urn:informatica-aci.it:sap:private:ni', 'cache') : my_ext }
    
    ns = etree.FunctionNamespace("urn:informatica-aci.it:sap:private:ni")
    ns.prefix = "_ni"
    ns["get-cache"] = my_ext.get_cache
    
    # step 2.3: read the input file
    xslt = etree.XSLT(etree.parse(xslt_file), extensions=extensions)
    
    # step 3: apply the transformation    
    
    try:
      # step 3.1: transform
      result = xslt(xml, **args_params)
    
      # step 3.2: write output
      result.write(args_out)
      args_out.flush()
      args_out.close()
    except Exception as ex:
      print(ex)
    
    # step 3.3: write error log
    for item in xslt.error_log:
      print(item.message, file=sys.stderr)
