# encoding: utf-8

string = "Hëlló Wôrld".encode("US-ASCII", undef: :replace, replace: "")

p string.encoding
p string