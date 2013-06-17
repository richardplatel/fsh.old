class Fsh
    def echo(*a)
        a.join(' ') + "\n"
    end

    def ls(dir='.')
        begin
            Dir.entries(dir).join(' ')
        rescue Errno::ENOENT => e
            "ls: "+ dir + ": No such file or directory"
        end
    end
end
