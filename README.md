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
