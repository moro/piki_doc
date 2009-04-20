フィーチャ: Asinプラグインを試す
  プラグイン作者として
  Asinプラグインがちゃんと動いていることを確認したい

  背景:
  前提    "Asin"プラグインを登録する

  シナリオ: ブロックプラグイン
  もし   以下のHiki記法テキストをXHTMLにする
    """
! ASIN Railsレシピブック
{{asin('4797336625', 'morodiary05-22')}}
    """
  # かつ   結果を目視
  ならば "div.plugin.asin > iframe"要素が含まれること

  シナリオ: インラインプラグイン
  もし   以下のHiki記法テキストをXHTMLにする
    """
Railsレシピブック {{asin('4797336625', 'morodiary05-22')}}を書きました。
    """
  # かつ   結果を目視
  ならば "span.plugin.asin > a[href='http://www.amazon.co.jp/exec/obidos/ASIN/4797336625/morodiary05-22/ref=nosim']"要素が含まれること

