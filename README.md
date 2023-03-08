## MVVMを理解するためのリポジトリ
### MVVMとは？
(Model-View-ViewModel)
- Model→ドメインを担う  
  = Viewの描写について知る必要はない→Viewの装飾についての情報を持っていてもok
  (ViewとViewModelの責務以外全て)
- View(View+VC)→UIの描写、入力の通知   
- ViewModel→Viewを描写するための状態のほじ、Viewからの入力を適切な形に変換してModelに伝達
________________
### メリット
①役割をソースコードレベルで分けることで変更による影響を最小限に押さえられる　　
②UI、ロジックを分業化する → 変更箇所が特定しやすくできる & テストが書きやすい  
③Viewに素早くデータを反映できる 
④FatVCの解消
_______________
### デメリット/注意点  
①FatVMになりやすい  
②動作の動きが見えずらい
________________
### MVCとの違い 
MVCとは？
- Model→データ構造、request
- View→UI
- Controller→View,Modelの制御
  
違い
- MVVMのViewはMVCにおけるControllerも含む→View + ViewController
- MVVMのViewは状態を持たない
- ViewModelとModelが直接全てのやり取りをするのではなく、Modelが変更通知機能をもち、通知によって更新をViewModekに伝える  →Viewの変更する部分のみをViewModelが更新する

