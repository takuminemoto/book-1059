/*global $*/
// こちらは要件外です。prependはhtmlと違い、子要素の最初に差し込む挙動をします。
$("main > .container").prepend("<%= j(render 'layouts/errors', obj: @book_comment) %>");