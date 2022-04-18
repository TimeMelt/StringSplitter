# Jean-Paul Stevens
# Words to Sequences Splitter

class StringSplit
    
    # read input dictionary file "input.txt"
    def readFile()
        arr = IO.readlines("input.txt")
        return arr
    end 

    # function to write words to output file (words.txt)
    def writeWordOutput(inputData)
        aFile = File.open("words.txt", "w+") do |f|
            f.puts(inputData)
        end
    end

    # create 4 character sequences and write to output file (sequences.txt)
    def writeSeqOutput(inputData)

        newData = Array.new # create array to store new strings 
    
        # read input file, 
        File.open("input.txt") do |file|
           file.each_line(4) do |characters| # divide strings into 4 character pieces
              characters.gsub!(/[^A-Za-z]/, '') # remove numbers and special characters
              newData.push(characters) # store new string into array "newData"
            end
        end    
        
        newData = newData.reject { |c| c.empty? || c.length < 4 } # remove blank entries and entries under 4 characters
        newData = newData.uniq # remove duplicate sequences

        # write sequences to output file (sequences.txt)
        aFile = File.open("sequences.txt", "w+") do |f|
            f.puts(newData)
        end
    end
   
end

SS = StringSplit.new
inputData = SS.readFile() # read and store input dictionary file "input.txt"
SS.writeWordOutput(inputData) # write to "words.txt" output file
SS.writeSeqOutput(inputData) # write to "sequences.txt" output file