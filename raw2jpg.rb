#! /usr/bin/ruby

def raw2jpg(file_or_dir)
  if File.directory?(file_or_dir)
    ((Dir.entries file_or_dir) - ['.', '..']).each do |entry|
        raw2jpg(File.join(file_or_dir, entry))
    end
    puts "#{file_or_dir} is proccessed"
  end

  if raw_file?(file_or_dir)
    `dcraw -e #{file_or_dir}`
  end
end

def raw_file?(path)
  return unless File.file?(path)
  raw_exts = %w(.cr2 .crw .raw .dng .erf .raf .kdc .mrw .nef .nrw .orf .rw2 .pef .srw .arw .x3f)
  raw_exts.include?(File.extname(path).downcase)
end

if __FILE__ == $0
  raw2jpg(ARGV[0])
end
