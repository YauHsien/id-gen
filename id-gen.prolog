:- encoding(utf8).
%% 中華民國國民身分證統一編號

gen_1(A) :-
    member(A, [1,2,8,9]).

gen_2_to_8([B,C,D,E,F,G,H]) :-
    between(0, 9, B),
    between(0, 9, C),
    between(0, 9, D),
    between(0, 9, E),
    between(0, 9, F),
    between(0, 9, G),
    between(0, 9, H).

n('A', '臺北市', 1, 0).
n('B', '臺中市', 1, 1).
n('C', '基隆市', 1, 2).
n('D', '臺南市', 1, 3).
n('E', '高雄市', 1, 4).
n('F', '新北市', 1, 5).
n('G', '宜蘭縣', 1, 6).
n('H', '桃園市', 1, 7).
n('I', '嘉義市', 3, 4).
n('J', '新竹縣', 1, 8).
n('K', '苗栗縣', 1, 9).
n('M', '南投縣', 2, 1).
n('N', '彰化縣', 2, 2).
n('O', '新竹市', 3, 5).
n('P', '雲林縣', 2, 3).
n('Q', '嘉義縣', 2, 4).
n('T', '屏東縣', 2, 7).
n('U', '花蓮縣', 2, 8).
n('V', '臺東縣', 2, 9).
n('W', '金門縣', 3, 2).
n('X', '澎湖縣', 3, 0).
n('Z', '連江縣', 3, 3).
%n('L', '臺中縣', 2, 0).
%n('R', '臺南縣', 2, 5).
%n('S', '高雄縣', 2, 6).
%n('Y', '臺北市', 3, 1).

c(N1, N2, A, [B,C,D,E,F,G,H], K) :-
    SoP is
    N1
    + N2 * 9
    + A * 8
    + B * 7
    + C * 6
    + D * 5
    + E * 4
    + F * 3
    + G * 2
    + H,
    between(0, 9, K),
    (SoP + K) rem 10 =:= 0, !.

id([S,A,B,C,D,E,F,G,H,K]) :-
    n(S, _, N1, N2),
    gen_1(A),
    gen_2_to_8([B,C,D,E,F,G,H]),
    c(N1, N2, A, [B,C,D,E,F,G,H], K).

d([A,B,C,D,E,F,G,H]) :-
    gen_1(A),
    gen_2_to_8([B,C,D,E,F,G,H]).

pid(Id) :-
    id([S,A,B,C,D,E,F,G,H,K]),
    format(atom(Id), "~w~d~d~d~d~d~d~d~d~d", [S,A,B,C,D,E,F,G,H,K]).

idnum(Num) :-
    gen_1(A), gen_2_to_8([B,C,D,E,F,G,H]),
    format(atom(Num), "~d~d~d~d~d~d~d~d", [A,B,C,D,E,F,G,H]).

go :-
    foreach(pid(Id), writeln(Id)).

go_1 :-
    foreach(idnum(Num), writeln(Num)).

:- set_prolog_flag(stack_limit, 17_179_869_184).
