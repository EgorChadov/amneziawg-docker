# amneziawg-docker

To create amneziawg interface:

1. Build docker image from Dockerfile (docker build -t amnezia-wg .)
2. Change awg0 conf file (keys for server and peer)
3. Change path to conf file in docker-compose.yml
4. docker compose -up d


Parameters:
Jc — 1 ≤ Jc ≤ 128; recommended range is from 3 to 10 inclusive  

Jmin — Jmin < Jmax; recommended value is 50

Jmax — Jmin < Jmax ≤ 1280; recommended value is 1000

S1 — S1 < 1280; S1 + 56 ≠ S2; recommended range is from 15 to 150 inclusive

S2 — S2 < 1280; recommended range is from 15 to 150 inclusive

H1/H2/H3/H4 — must be unique among each other; recommended range is from 5 to 2147483647 inclusive


Don't forget to add all junk parametrs to the client conf file
