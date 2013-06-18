class Fsh
    def echo(*a)
        a.join(' ') + "\n"
    end

    def ls(dir='.')
        if File.directory?(dir)
            result = Dir.entries(dir)
        elsif File.exists?(dir)
            result = [dir]
        else
            return "ls: "+ dir + ": No such file or directory"
        end
        return result.join(' ')
    end
end
