# language: ja
フィーチャ: Gistプラグインを試す
  プラグイン作者として
  Gistプラグインがちゃんと動いていることを確認したい

  背景:
  前提   "Gist"プラグインを登録する

  シナリオ: ブロックプラグイン
  もし   以下のHiki記法テキストをXHTMLにする
    """
! Gist
{{gist(123456)}}
    """
  # かつ   結果を目視
  ならば "div.plugin.gist > script[src='http://gist.github.com/123456.js']"要素が含まれること
  かつ   "h1"要素のテキストは"Gist"であること

  シナリオ: インラインプラグイン
  もし   以下のHiki記法テキストをXHTMLにする
    """
! Gist
こちらをご覧ください。{{gist(123456)}}
    """
  # かつ   結果を目視
  ならば "a[href='http://gist.github.com/123456']"要素が含まれること
  かつ   "h1"要素のテキストは"Gist"であること

