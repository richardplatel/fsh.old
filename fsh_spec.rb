require 'fsh'

describe Fsh do
    describe '#echo' do
        it 'with no args, returns nl' do
            expect(Fsh.new.echo).to eq("\n")
        end
        it 'returns args joined with space terminated with nl' do
            expect(Fsh.new.echo("The quick", "brown dog", "etc.  etc")).to eq("The quick brown dog etc.  etc\n")
        end
    end
    describe '#ls' do
        it 'returns the content of the current directory' do
            Dir.stub(:entries => ['.', '..'])
            expect(Fsh.new.ls).to eq('. ..')
        end
        it 'returns the content of the root directory' do
            root_list = ['.', '..', '/bin', '/etc', '/home', '/usr', '/var']
            Dir.stub(:entries => root_list)
            expect(Fsh.new.ls('/')).to eq(root_list.join(' '))
        end
        it 'returns an error for a non-existent argument' do
            Dir.stub(:entries) {raise Errno::ENOENT}
            expect(Fsh.new.ls('/No/Such/Dir')).to eq("ls: /No/Such/Dir: No such file or directory")
        end
        it 'returns the argument when argument is a file' do
            File.stub(:directory? => false)
            File.stub(:exists? => true)
            expect(Fsh.new.ls("a_file.txt")).to eq("a_file.txt")
        end
    end
end
