
class String

def red;            "\e[31m#{self}\e[0m" end
def green;          "\e[32m#{self}\e[0m" end
def blue;           "\e[34m#{self}\e[0m" end
def gray;           "\e[37m#{self}\e[0m" end
def yellow;         "\e[1;33m#{self}\e[0m" end
def bold;           "\e[1m#{self}\e[22m" end
end

