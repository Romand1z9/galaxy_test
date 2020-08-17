<?php 

$example = "
	@storm87 сообщил нам вчера о @romand1z9 результатах @asdsa \n
	Я живу в одном доме с @300spartans
";

echo highlight_nicknames($example);

function highlight_nicknames(string $text = ''): string {
	
	return preg_replace(
		"/((^|\s)(@{1}[a-z]{1}[a-z0-9]+)($|\s))/im", 
		"<b>$1</b>", 
		$text
	);
	
}

?>