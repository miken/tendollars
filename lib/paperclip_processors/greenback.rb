module Paperclip
  class Greenback < Processor
    def make
      basename = File.basename(file.path, File.extname(file.path))
      dst_format = options[:format] ? ".\#{options[:format]}" : ''

      bill_path = options[:bill_path]

      dst = Tempfile.new([basename, dst_format])
      dst.binmode

      convert(':src -gravity center -resize x300 -extent 708x300+75 :bill_path -composite :dst',
              src: File.expand_path(file.path),
              bill_path: bill_path,
              dst: File.expand_path(dst.path))

      dst
    end
  end
end