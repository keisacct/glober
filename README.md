# アプリケーション名
GLOBER

# アプリケーション概要
海外在住もしくは海外在住予定のユーザー同士で情報交換とSNS上でその先の繋がりを広げることができる

# URL

# テスト用アカウント
- Basic認証ID：
- Basic認証Password：
- メールアドレス：
- パスワード：

# 利用方法
## 質問投稿

# アプリケーションを作成した背景
自身の海外留学の経験とインターネット検索から、「留学や海外赴任などで海外移住を考えているが、事前準備のための情報交換の場がない」「実際に海外へ赴いたとしても、現地にいる日本人と繋がることが難しい」といった課題があると考えた。課題を分析した結果、「情報交換をするプラットフォームが整備されていない」ということが根因だと仮説を立てた。同様の問題を抱えている方が留学時代の当時から現在にかけて多数存在すると推測し、その根因を解決するために、海外在住もしくは海外在住予定のユーザー同士でQ＆Aをベースとした情報交換とSNS上でその先の繋がりを広げることができるような海外に関するQ＆Aアプリケーションを開発することにした。

# 洗い出した要件
https://docs.google.com/spreadsheets/d/1D8LC7zbPprUyPFEQKF3HVjMN3V0I1ghVWAcVVVXF6tc/edit?usp=sharing

# テーブル設計
## usersテーブル
| Column                | Type          | Options                            |
| --------------------- | ------------- | ---------------------------------- |
| email                 | string        | null: false                        |
| password              | string        | null: false                        |
| gmail_id              | string        |                                    |
| facebook_id           | string        |                                    |
| linkedin_id           | string        |                                    |
| twitter_id            | string        |                                    | 

### Associations
- has_one :profile, dependent: :destroy
- has_one :sns_credential, dependent: :destroy
- has_many :questions
- has_many :answers

## sns_credentialsテーブル
| Column                | Type          | Options                            |
| --------------------- | ------------- | ---------------------------------- |
| user                  | references    | foreign_key: true                  |
| provider              | string        |                                    |
| uid                   | string        |                                    |

### Associations
- belongs_to :user

## profilesテーブル
| Column                | Type          | Options                                |
| --------------------- | ------------- | -------------------------------------- |
| user                  | references    | null: false, foreign_key: true         |
| user_icon             | string        |                                        |
| username              | string        | null: false, default: '', unique: true |
| introduction          | text          |                                        |
| twitter_url           | varchar       |                                        |
| linkedin_url          | varchar       |                                        |
| facebook_url          | varchar       |                                        |
| blog_url              | varchar       |                                        | 
| stayed_countries      | references    | foreign_key: true                      |

### Associations
- belongs_to :user
- has_many :stayed_countries, dependent: :destroy
- has_many :visited_countries, dependent: :destroy
- has_many :wannastay_countries, dependent: destroy
- has_many :wannavisit_countries, dependent, destroy

## stayed_countriesテーブル
| Column                | Type          | Options                                |
| --------------------- | ------------- | -------------------------------------- |
| profile               | references    | null: false, foreign_key: true         |
| country_id            | integer       |                                        |

### Associations
- belongs_to :profile
- belongs_to  :country

## visited_countriesテーブル
| Column                | Type          | Options                                |
| --------------------- | ------------- | -------------------------------------- |
| profile               | references    | null: false, foreign_key: true         |
| country_id            | integer       |                                        |

### Associations
- belongs_to :profile
- belongs_to  :country

## wannastay_countriesテーブル
| Column                | Type          | Options                                |
| --------------------- | ------------- | -------------------------------------- |
| profile               | references    | null: false, foreign_key: true         |
| country_id            | integer       |                                        |

### Associations
- belongs_to :profile
- belongs_to  :country

## wannavisit_countriesテーブル
| Column                | Type          | Options                                |
| --------------------- | ------------- | -------------------------------------- |
| profile               | references    | null: false, foreign_key: true         |
| country_id            | integer       |                                        |

### Associations
- belongs_to :profile
- belongs_to  :country

## questionsテーブル
| Column                | Type          | Options                                |
| --------------------- | ------------- | -------------------------------------- |
| title                 | string        | null: false                            |
| content               | text          | null: false                            |
| user                  | references    | null: false, foreign_key: true         |
| best_answer           | references    | foreign_key: true                      |

### Associations
- belongs_to :user
- has_one :best_answer
- has_many :answers
- has_many :likes, dependent: :destroy
- has_many :tag_maps, dependent: :destroy

## likesテーブル
| Column                | Type          | Options                                |
| --------------------- | ------------- | -------------------------------------- |
| question              | references    | null: false, foreign_key: true         |
| user                  | references    | null: false, foreign_key: true         |

### Associations
- belongs_to :user
- belongs_to :question

## tag_mapsテーブル
| Column                | Type          | Options                                |
| --------------------- | ------------- | -------------------------------------- |
| question              | references    | null: false, foreign_key: true         |
| tag_id                | integer       |                                        |

### Associations
- belongs_to :question
- belongs_to :tag

## answersテーブル
| Column                | Type          | Options                                |
| --------------------- | ------------- | -------------------------------------- |
| content               | text          | null: false                            |
| user                  | references    | null: false, foreign_key: true         |
| question              | references    | null: false, foreign_key: true         |
| best_answer           | references    | foreign_key: true                      |

### Associations
- belongs_to :user
- belongs_to :question
- has_one :best_answer

## best_answersテーブル
| Column                | Type          | Options                                |
| --------------------- | ------------- | -------------------------------------- |
| question              | references    | null: false, foreign_key: true         |
| answer                | references    | null: false, foreign_key: true         |

### Associations
- belongs_to :question
- belongs_to :answer

# データベース設計
[![Image from Gyazo](https://i.gyazo.com/48bb510156f0eaa064ec022d88f97667.png)](https://gyazo.com/48bb510156f0eaa064ec022d88f97667)


# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/0fc4e3fbb151c0e95ff34dfc4199462a.png)](https://gyazo.com/0fc4e3fbb151c0e95ff34dfc4199462a)

# 開発環境

# ローカルでの動作方法

# 工夫したポイント
