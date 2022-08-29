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

# 洗い出した要件
https://docs.google.com/spreadsheets/d/1D8LC7zbPprUyPFEQKF3HVjMN3V0I1ghVWAcVVVXF6tc/edit?usp=sharing

# テーブル設計
## Userテーブル
| Column                | Type          | Options                            |
| --------------------- | ------------- | ---------------------------------- |
| email                 | string        | null: false                        |
| encrypted_password    | string        | null: false                        |
| nickname              | string        | null: false                        |


## Questionsテーブル

## Likesテーブル

## TagMapsテーブル

## Answersテーブル

## BestAnswersテーブル

## CountryWantToStayテーブル

## CountryWantToVisitテーブル

## CountryStayedテーブル

## CountryVisitedテーブル

# データベース設計


# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/9377f8b8384a59a5707a9380795e2dfe.png)](https://gyazo.com/9377f8b8384a59a5707a9380795e2dfe)

# 開発環境

# ローカルでの動作方法

# 工夫したポイント
