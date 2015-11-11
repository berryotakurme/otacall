$(function (){
    var movies = [];
    var images = [];
    //全てのiframeタグに対して処理を実行する。
    $('iframe').each(function(index, element) {
        //iframeの中のsrc(埋め込みタグのURL)を取得。
        var movie_src = $(this).attr('src');
        //取得したURLはmovies配列に格納。
        movies[index] = movie_src
        //URLから動画idのみを取得して、文字連結をしてサムネイルを取得。
        images[index] = 'http://i.ytimg.com/vi' + movie_src.substring(movie_src.lastIndexOf("/")) + '/maxresdefault.jpg'
        //iframeをサムネイル画像に置き換える。
        $(this).after('<img src="' + images[index] + '" class="movie" height="180" width="240">').remove();
    });

    $('.movie').each(function(index, element) {
        //サムネイルがクリックされた時の処理
        $(this).click(function (){
            //iframeに置き換え。
            $(this).after('<iframe src="' + movies[index] + '?autoplay=1" width="240" height="180"></iframe>').remove();
        });
    });
});