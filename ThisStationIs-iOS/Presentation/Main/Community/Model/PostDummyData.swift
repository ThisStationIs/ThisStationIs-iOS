//
//  PostDummyData.swift
//  ThisStationIs-iOS
//
//  Created by min on 2023/08/28.
//

import Foundation

var postDummyData: [PostModel] = [
    PostModel(
        idx: 1,
        userName: "행복한 바나나",
        writeDate: Date().dateToString(),
        category: "사건사고",
        subway: "1호선",
        title: "1호선 빌런 등장",
        content: "여러분 지금 5-3 쪽에 이상한 분 계시니까 조심하세요.. 진짜 세상 무섭네요"
    ),
    PostModel(
        idx: 2,
        userName: "산뜻한 카타크",
        writeDate: Date().dateToString(),
        category: "알쓸신잡",
        subway: "인천 1호선",
        title: "비건들아 집중해라",
        content: "비건이신 분 근처에 마을 상점 생활관이라고 서점 겸 잡동사니 파는 곳이 있는데 지하철 역 근처임, 반려동물 출입 가능함. 비건들을 위한 동네 책방으로 생각하면 됨"
    ),
    PostModel(
        idx: 3,
        userName: "애틋한 감자풀",
        writeDate: Date().dateToString(),
        category: "기타",
        subway: "수인분당선",
        title: "수인분당 이게 맞아?",
        content: "지하철 연착 이게 맞아? 저 버스 타야 한다고요.. 진짜 정신 차리자 수인분당선.."
    ),
    PostModel(
        idx: 4,
        userName: "행복한 바나나",
        writeDate: Date().dateToString(),
        category: "질문",
        subway: "2호선",
        title: "카리나 생일광고",
        content: "2호선 무슨 역에 걸려있어요? 보고 싶은데 서울 지하철이 어려운 지방러1 2호선에서 미아됨"
    ),
    PostModel(
        idx: 5,
        userName: "슬픈 바닐라",
        writeDate: Date().dateToString(),
        category: "분실물",
        subway: "4호선",
        title: "파란색 카드 지갑 보신 분",
        content: "오늘 오전 11시 쯤에 4호선에 파란색 카드 지갑 두고 내린 것 같아요ㅠㅠㅠ 혹시 보신 분 있으시면 댓글 남겨주세요ㅠㅠ 그거 제가 진짜 아끼는 거라 꼭 찾고 싶어요ㅠ"
    ),
    PostModel(
        idx: 6,
        userName: "애틋한 감자풀",
        writeDate: Date().dateToString(),
        category: "질문",
        subway: "공항철도",
        title: "인천공항 2터미널 가고싶어요",
        content: "아니 무슨 공항철도 양쪽에 아무거나 타도 된다고 하지 않았어요? 왜 저 여기 어디인지 잘 모르겠어요 비행기 타러 가야하는데 정말 아무거나 타도 되는 거 맞죠?"
    ),
    PostModel(
        idx: 7,
        userName: "사랑스러운 마피아",
        writeDate: Date().dateToString(),
        category: "기타",
        subway: "용인에버라인",
        title: "에버랜드 눈치 게임 성공",
        content: "와 오늘 에버랜드 눈치 게임 성공이다. 이 글 본 사람들 당장 에버랜드 ㄱㄱ"
    ),
    PostModel(
        idx: 8,
        userName: "슬픈 바닐라",
        writeDate: Date().dateToString(),
        category: "질문",
        subway: "1호선",
        title: "1호선 무슨 일임?",
        content: "지금 구로역인데 뭐임? 왜이렇게 시끄러움? 뭔일 남? 무서워서 뭔가 가고싶진 않은데 누가 좀 알려줘봐"
    ),
    PostModel(
        idx: 9,
        userName: "재미난 이야기작가",
        writeDate: Date().dateToString(),
        category: "질문",
        subway: "2호선",
        title: "주말 나들이 장소 추천",
        content: "이번 주말에 2호선 역 중에 어디 아무대나 가보려고 하는데 추천 좀 부탁드려요! 어딜 가면 좋을까요?"
    ),
    PostModel(
        idx: 10,
        userName: "모험적인 길잡이",
        writeDate: Date().dateToString(),
        category: "알쓸신잡",
        subway: "5호선",
        title: "서울 지하철에서 열리는 다가오는 문화 이벤트 소식",
        content: "서울 지하철에서 진행되는 다가오는 문화 이벤트가 많아요. 어떤 이벤트가 있는지 알고 계신가요? 다가오는 이벤트 정보를 공유하고 함께 참여할 친구를 찾아봐요. 🎶🎉"
    ),
    PostModel(
        idx: 11,
        userName: "행복한 바나나",
        writeDate: Date().dateToString(),
        category: "기타",
        subway: "용인에버라인",
        title: "용인에버라인에서 에버랜드 얼마나 걸리나요?",
        content: "걸어서 갈 수 있나요??"
    ),
]

var commentDummyData: [CommentModel] = [
    CommentModel(
        idx: 1,
        userName: "행복한 바나나",
        writeDate: Date().dateToString(),
        comment: "2호선이면 잠실 롯데월드 좋죠! 그런데 주말이라서 사람 많은건 어쩔 수 없..."
    ),
    CommentModel(
        idx: 2,
        userName: "슬픈 바닐라",
        writeDate: Date().dateToString(),
        comment: "성수에 맛집 많아요! 힙한 사람도 많고, 그냥 뭔가 많아요 ㅋㅋㅋㅋ 한 번쯤은 가볼만 한 것 같아요!"
    ),
]
