require 'yaml'
require 'pry'

def load_library(lib)
  emotes = YAML.load_file(lib)
  emotes
  output = {}
  output["get_emoticon"] = {}
  output["get_meaning"] = {}
  emotes.each do
    |entry|
    output["get_emoticon"][entry[0]] = entry[1][1]
    output["get_emoticon"][entry[1][0]] = entry[1][1]
    output["get_meaning"][entry[1][1]] = entry[0]
  # binding.pry
  end
  output
end

def get_japanese_emoticon(file, emoticon)
  translator = load_library(file)
  translation = translator["get_emoticon"][emoticon]
  return translation != nil ? translation : "Sorry, that emoticon was not found"
end

def get_english_meaning(file, emoticon)
  translator = load_library(file)
  translation = translator["get_meaning"][emoticon]
  return translation != nil ? translation : "Sorry, that emoticon was not found"
end