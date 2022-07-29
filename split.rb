# Jean-Paul Stevens
# Words to Sequences Splitter

class StringSplit

    @wordData # array to store words.txt data
    @seqData # array to store sequences.txt data

    # init word and sequence
    def initialize()
        @wordData = Array.new
        @seqData = Array.new
    end

    # function to write words to output file (words.txt)
    def writeWordOutput()
    
        # read input file, 
        File.open("input.txt") do |file|
           file.each_line do |words|
              words = words.downcase 
              words.gsub!(/[^a-z]/, '') # remove numbers and special characters
              @wordData.push(words) # store new string into array "newData"
            end
        end    

        @wordData = @wordData.reject { |chars| chars.empty? || chars.length < 4 } # remove blank entries and entries under 4 characters
        @wordData = @wordData.uniq # remove duplicate sequences

        aFile = File.open("words.txt", "w+") do |f|
            f.puts(@wordData)
        end
    end

    # create 4 character sequences and write to output file (sequences.txt)
    def writeSeqOutput()
    
        # read input file, 
        File.open("input.txt") do |file|
           file.each_line(4) do |characters| # divide strings into 4 character pieces
              characters = characters.downcase 
              characters.gsub!(/[^a-z]/, '') # remove numbers and special characters
              @seqData.push(characters) # store new string into array "newData"
            end
        end    
        
        @seqData = @seqData.reject { |chars| chars.empty? || chars.length < 4 } # remove blank entries and entries under 4 characters
        @seqData = @seqData.uniq # remove duplicate sequences

        # write sequences to output file (sequences.txt)
        aFile = File.open("sequences.txt", "w+") do |f|
            f.puts(@seqData)
        end
    end
   
end

SS = StringSplit.new
SS.writeWordOutput() # write to "words.txt" output file
SS.writeSeqOutput() # write to "sequences.txt" output file