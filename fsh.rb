class Fsh
    def echo(*a)
        a.join(' ') + "\n"
    end

    def ls(dir='.')
        Dir.entries(dir).join(' ')
    end
end
