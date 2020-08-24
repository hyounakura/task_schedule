# 仕事管理アプリ


## アプリケーション概要  
カレンダーとスケジュール管理機能を実装しました。これを作成した背景として、前職のタスク管理をホワイトボードで行っており、社員の方がスケジュールを会社に戻って確認していたことがきっかけで作成しました。グループ機能をつけ、メンバー全員がスケジュールを確認できるように実装しました。

## URL
https://task-schedule-27914.herokuapp.com/

## テスト用アカウント  
* email  
t@t  
* password  
ta1234

## 利用方法

## 目指した課題解決

## 工夫したポイント
カレンダーの翌月、前月の実装です。カレンダーのviewにrailsで使用できるメソッドのDate.todayで今日の日付を取得して表示させていたのですが、翌月、前月を表すためにはそれにnext_month,prev_monthメソッドを使う必要がありました。翌月ボタン、前月ボタンを押すたびに次の月や前の月のカレンダーを表示させたかったので、それぞれのボタンのパラメータにインスタンスメソッドの＠countを持たせ、コントローラーで翌月の場合+1、前月の場合-1と条件分岐をし、@countの値を今日の月からどれだけ離れているかを表現しました。

## 実装した機能についてのGIFと説明

* 予定を作成し、確認することができます。  
https://gyazo.com/0059967b373aa5d638940eb02569fbd5

* 翌月、前月を表示できるように実装しました。  
https://gyazo.com/b42c92718bd3e999b1cf4b553915f876

## データベース設計

### Userテーブル

|Column|Type|Option|
|------|----|------|
|name|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false, unique:true|

#### Association

- has_many  :groups, through: :user_groups
- has_many  :user_groups
- has_many  :tasks, through: :user_task
- has_many  :user_tasks


### User_groupテーブル

|Column|Type|Option|
|------|----|------|
|user_id|references|foreign_key: true|
|group_id|references|foreign_key: true|

#### Association

- belongs_to :user
- belongs_to :group


### Groupテーブル

|Column|Type|Option|
|------|----|------|
|name|string|null: false|

#### Association

- has_many  :users, through: :user_groups
- has_many  :user_groups
- has_many  :tasks


### Taskテーブル

|Column|Type|Option|
|------|----|------|
|name|string|null: false|
|start_time_id|time|null: false|
|end_time_id|time|null: false|
|group_id|references|foreign_key: true|
|date_id|date|null: false|
|content|text|

#### Association

- has_many  :users, through: :user_tasks
- has_many  :user_tasks
- belongs_to  :group


### User_taskテーブル

|Column|Type|Option|
|------|----|------|
|user_id|references|foreign_key: true|
|task_id|references|foreign_key: true|

#### Association

- belongs_to :user
- belongs_to :task

