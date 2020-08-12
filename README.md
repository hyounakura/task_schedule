# タスクスケジュールアプリ


* アプリケーション概要  
カレンダーとスケジュール管理機能を実装しました。これを作成した背景として、前職のタスク管理をホワイトボードで行っており、スケジュールを会社に戻って確認しなくて済むようにすることを目標にして作成しました。グループ機能をつけ、メンバー全員がスケジュールを確認できるように実装しました。

* URL
https://task-schedule-27914.herokuapp.com/

* テスト用アカウント  
-- email  
t@t  
-- password  
ta1234

* 利用方法

* 目指した課題解決

* 洗い出した要件

* 実装した機能についてのGIFと説明

* ローカルでの動作方法

* データベース設計

## Userテーブル

|Column|Type|Option|
|------|----|------|
|name|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false, unique:true|

### Association

- has_many  :groups, through: :user_groups
- has_many  :user_groups
- has_many  :tasks, through: :user_task
- has_many  :user_tasks


## User_groupテーブル

|Column|Type|Option|
|------|----|------|
|user_id|references|foreign_key: true|
|group_id|references|foreign_key: true|

### Association

- belongs_to :user
- belongs_to :group


## Groupテーブル

|Column|Type|Option|
|------|----|------|
|name|string|null: false|

### Association

- has_many  :users, through: :user_groups
- has_many  :user_groups
- has_many  :tasks


## Taskテーブル

|Column|Type|Option|
|------|----|------|
|name|string|null: false|
|start_time_id|time|null: false|
|end_time_id|time|null: false|
|group_id|references|foreign_key: true|
|date_id|date|null: false|
|content|text|

### Association

- has_many  :users, through: :user_tasks
- has_many  :user_tasks
- belongs_to  :group


## User_taskテーブル

|Column|Type|Option|
|------|----|------|
|user_id|references|foreign_key: true|
|task_id|references|foreign_key: true|

### Association

- belongs_to :user
- belongs_to :task

