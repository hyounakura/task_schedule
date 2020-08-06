# タスクスケジュールアプリ


* アプリケーション概要

* URL

* テスト用アカウント

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
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

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
|place|string|null: false|
|group_id|integer|null: false, foreign_key: true|
|date_id|date|null: false|

### Association

- has_many  :users, through: :user_tasks
- has_many  :user_tasks
- belongs_to  :group
- has_one  :content


## User_taskテーブル

|Column|Type|Option|
|------|----|------|
|user_id|integer|null: false, foreign_key: true|
|task_id|integer|null: false, foreign_key: true|

### Association

- belongs_to :user
- belongs_to :task


## Contentテーブル

|Column|Type|Option|
|------|----|------|
|work_content|text|
|add|text|
|task_id|integer|null: false, foreign_key: true|

### Association

- belongs_to  :task
- has_many  :items, through: :content_items
- has_many  :content_items


## Content_itemテーブル

|Column|Type|Option|
|------|----|------|
|content_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|

### Association

- belongs_to :content
- belongs_to :item


## Itemテーブル

|Column|Type|Option|
|------|----|------|
|name|string|null: false|

### Association

- has_many :content_item