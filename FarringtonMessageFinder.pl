use strict;

my $text = $ARGV[0]; #user input file
my $message = $ARGV[1];#secret message to be found
my $content = ""; #all of the book text
my $find = ""; #the message formated to search the content
my $interval = 1; #have a loop to increase search interval after each search. to 25

#opens file and puts all text into $content
open(my $file,'<',$text);
	while (<$file>){
		$content .= $_;
	}
	while($interval < 25){
		$interval++;
		for(my $i = 0;$i<length $message; $i++){
			$find .= substr($message,$i,1);
			$find .= ".{$interval}"; 
	}
	#print "find: $find\n";
	if($content =~ /$find/is){
		print "found secret message \"$message\" in $text at an interval of $interval characters \n";
	}
	$find = ""; #clears variable in preparation for next searchy
}


