# README

## bootstrap4の導入
- gemfileに追記
```
gem 'bootstrap', '~> 4.5'
gem 'jquery-rails'
```
- bundle install
- application.css →　application.scssに変更
- application.scssに追記
```
@import "bootstrap";
```
- application.jsに追記　※追記箇所に注意
```
//= require jquery3
//= require popper
//= require bootstrap-sprockets

//= require rails-ujs

:
:

```

## fontawesomeの導入
- gemfileに追記
```
:
:

gem 'font-awesome-sass', '~> 5.13'
```
- application.scssに追記

```
@import 'font-awesome-sprockets';
@import 'font-awesome';
```

## その他
- sticky-footer
- toggle-menuの閉じるcss