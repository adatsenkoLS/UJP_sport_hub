module SvgHelper
  def show_svg(path)
    File.open("app/assets/images/#{path}", 'rb') do |file|
      # Ask about raw!!!
      raw file.read
    end
  end
end
