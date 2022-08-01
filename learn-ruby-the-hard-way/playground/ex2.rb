# Comment
puts "One-line comment"

=begin
  Comment
=end
puts "Multi-line comment"

<<-DOC
  DOC comment
DOC
puts "DOC comment"

"
  Multi-line comment
"
puts "String literal comment"

# End of file
__END__
puts "This is after the __END__"

