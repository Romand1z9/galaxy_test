<?php 

/*
Написать реализацию функции function highlight_nicknames(string $text): string

Функция получает на вход текстовую строку, а на выходе возвращает строку с никами,
выделенными тегом <b> .

Правила для определения ника:
- Обозначением начала ника служит символ @
- Ник должен начинаться после пробельного символа или начала строки
- Ник должен заканчиваться пробельным символом или концом строки
- Ник должен состоять из символов английского алфавита и цифр
- Ник не должен начинаться с цифры
*/


$example = "
	@storm87 сообщил нам вчера о результатах\n
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