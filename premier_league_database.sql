--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: postgres; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: equipos; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE equipos (
    id integer NOT NULL,
    nombre character varying NOT NULL
);


--
-- Name: jugadores; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE jugadores (
    id integer NOT NULL,
    nombre character varying NOT NULL,
    equipo character varying,
    posicion character varying
);


--
-- Name: partidos; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE partidos (
    id integer NOT NULL,
    jornada integer,
    local character varying,
    visitante character varying,
    goles_local integer,
    goles_visitante integer
);


--
-- Name: resultados; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE resultados (
    id integer NOT NULL,
    jugador character varying NOT NULL,
    jornada integer,
    puntos integer,
    goles integer,
    asistencias integer,
    tarjetas_amarillas integer,
    tarjetas_rojas integer
);


--
-- Data for Name: equipos; Type: TABLE DATA; Schema: public; Owner: -
--

COPY equipos (id, nombre) FROM stdin;
1	Nottingham Forest
2	Sheffield United
3	Fulham
4	FC Brentford
5	Liverpool
6	AFC Bournemouth
7	Luton Town
8	Burnley
9	Wolverhampton
10	Brighton & Hove Albion
11	Tottenham Hotspur
12	Manchester United
13	Manchester City
14	Newcastle
15	Aston Villa
16	Everton
17	West Ham United
18	Chelsea
19	Crystal Palace
20	Arsenal
\.


--
-- Data for Name: jugadores; Type: TABLE DATA; Schema: public; Owner: -
--

COPY jugadores (id, nombre, equipo, posicion) FROM stdin;
1	James Trafford	Burnley	PT
2	Ameen Al-Dakhil	Burnley	DF
3	Connor Roberts	Burnley	DF
4	Dara O'Shea	Burnley	DF
5	Jordan Beyer	Burnley	DF
6	Vitinho	Burnley	DF
7	Josh Cullen	Burnley	MC
8	Sander Berge	Burnley	MC
9	Luca Koleosho	Burnley	DL
10	Lyle Foster	Burnley	DL
11	Zeki Amdouni	Burnley	DL
12	Anass Zaroury	Burnley	DL
13	Jacob Bruun Larsen	Burnley	DL
14	Manuel Hedilazio	Burnley	DL
15	Josh Brownhill	Burnley	MC
16	Redmond	Burnley	MC
17	Ederson	Manchester City	PT
18	Ake	Manchester City	DF
19	Kyle Walker	Manchester City	DF
20	Manuel Akanji	Manchester City	DF
21	Rico Lewis	Manchester City	DF
22	Bernardo Silva	Manchester City	MC
23	de Bruyne	Manchester City	MC
24	Rodrigo	Manchester City	MC
25	Erling Haaland	Manchester City	DL
26	Foden	Manchester City	DL
27	Julián Álvarez	Manchester City	DL
28	Mateo Kovacic	Manchester City	MC
29	Josko Gvardiol	Manchester City	DF
30	Laporte	Manchester City	DF
31	Cole Palmer	Manchester City	MC
32	James McAtee	Manchester City	MC
33	Ramsdale	Arsenal	PT
34	Ben White	Arsenal	DF
35	Jurrien Timber	Arsenal	DF
36	William Saliba	Arsenal	DF
37	Ødegaard	Arsenal	MC
38	Rice	Arsenal	MC
39	Thomas	Arsenal	MC
40	Bukayo Saka	Arsenal	DL
41	Edward Nketiah	Arsenal	DL
42	Gabriel Martinelli	Arsenal	DL
43	Kai Havertz	Arsenal	DL
44	Takehiro Tomiyasu	Arsenal	DF
45	Leandro Trossard	Arsenal	DL
46	Gabriel Magalhães	Arsenal	DF
47	Matt Turner	Nottingham Forest	PT
48	Aina	Nottingham Forest	DF
49	Aurier	Nottingham Forest	DF
50	Joe Worrall	Nottingham Forest	DF
51	Scott McKenna	Nottingham Forest	DF
52	Willy Boly	Nottingham Forest	DF
53	Brennan Johnson	Nottingham Forest	MC
54	Danilo	Nottingham Forest	MC
55	Gibbs-White	Nottingham Forest	MC
56	Orel Mangala	Nottingham Forest	MC
57	Ryan Yates	Nottingham Forest	MC
58	Taiwo Awoniyi	Nottingham Forest	DL
59	Neco Williams	Nottingham Forest	DF
60	Anthony Elanga	Nottingham Forest	DL
61	Kouyate	Nottingham Forest	MC
62	Wood	Nottingham Forest	DL
63	Wes Foderingham	Sheffield United	PT
64	Anel Ahmedhodzic	Sheffield United	DF
65	Chris Basham	Sheffield United	DF
66	George Baldock	Sheffield United	DF
67	Jack Robinson	Sheffield United	DF
68	John Egan	Sheffield United	DF
69	Max Lowe	Sheffield United	DF
70	Ben Osborn	Sheffield United	MC
71	Norwood	Sheffield United	MC
72	Bénie Traoré	Sheffield United	DL
73	William Osula	Sheffield United	DL
74	Yasser Larouci	Sheffield United	DF
75	Anis Slimane	Sheffield United	MC
76	Vini Souza	Sheffield United	MC
77	Andre Brooks	Sheffield United	MC
78	Sam Johnstone	Crystal Palace	PT
79	Joachim Andersen	Crystal Palace	DF
80	Joel Ward	Crystal Palace	DF
81	Marc Guehi	Crystal Palace	DF
82	Tyrick Mitchell	Crystal Palace	DF
83	Cheick Doucouré	Crystal Palace	MC
84	Eberechi Eze	Crystal Palace	MC
85	Jefferson Lerma	Crystal Palace	MC
86	Schlupp	Crystal Palace	MC
87	Jordan Ayew	Crystal Palace	DL
88	Odsonne Edouard	Crystal Palace	DL
89	Tomkins	Crystal Palace	DF
90	Pickford	Everton	PT
91	Ashley Young	Everton	DF
92	Michael Keane	Everton	DF
93	Nathan Patterson	Everton	DF
94	Tarkowski	Everton	DF
95	Abdoulaye Doucouré	Everton	MC
96	Amadou Onana	Everton	MC
97	Idrissa Gueye	Everton	MC
98	James Garner	Everton	MC
99	Iwobi	Everton	DL
100	Neal Maupay	Everton	DL
101	Arnaut Danjuma	Everton	DL
102	Bernd Leno	Fulham	PT
103	Antonee Robinson	Fulham	DF
104	Issa Diop	Fulham	DF
105	Kenny Tete	Fulham	DF
106	Tim Ream	Fulham	DF
107	Harry Wilson	Fulham	MC
108	Reed	Fulham	MC
109	Sasa Lukic	Fulham	MC
110	Tom Cairney	Fulham	MC
111	Raúl Jiménez	Fulham	DL
112	Willian	Fulham	DL
113	Bobby Reid	Fulham	MC
114	Pereira	Fulham	MC
115	Mitrovic	Fulham	DL
116	Jason Steele	Brighton & Hove Albion	PT
117	Dunk	Brighton & Hove Albion	DF
118	Estupiñán	Brighton & Hove Albion	DF
119	Van Hecke	Brighton & Hove Albion	DF
120	Groß	Brighton & Hove Albion	MC
121	Mahmoud Dahoud	Brighton & Hove Albion	MC
122	March	Brighton & Hove Albion	MC
123	Milner	Brighton & Hove Albion	MC
124	João Pedro	Brighton & Hove Albion	DL
125	Kaoru Mitoma	Brighton & Hove Albion	DL
126	Welbeck	Brighton & Hove Albion	DL
127	Billy Gilmour	Brighton & Hove Albion	MC
128	Simon Adingra	Brighton & Hove Albion	DL
129	Evan Ferguson	Brighton & Hove Albion	DL
130	Joël Veltman	Brighton & Hove Albion	DF
131	Julio Enciso	Brighton & Hove Albion	DL
132	Thomas Kaminski	Luton Town	PT
133	Amari'i Bell	Luton Town	DF
134	Issa Kaboré	Luton Town	DF
135	Mads Andersen	Luton Town	DF
136	Ryan Giles	Luton Town	DF
137	Tom Lockyer	Luton Town	DF
138	Marvelous Nakamba	Luton Town	MC
139	Pelly-Ruddock Mpanzu	Luton Town	MC
140	Carlton Morris	Luton Town	DL
141	Elijah Adebayo	Luton Town	DL
142	Tahith Chong	Luton Town	DL
143	Alfie Doughty	Luton Town	MC
144	Jacob Brown	Luton Town	DL
145	Chiedozie Ogbene	Luton Town	DL
146	Luke Berry	Luton Town	MC
147	Cauley Woodrow	Luton Town	DL
148	Neto	AFC Bournemouth	PT
149	Ilya Zabarnyi	AFC Bournemouth	DF
150	Marcos Senesi	AFC Bournemouth	DF
151	Max Aarons	AFC Bournemouth	DF
152	Milos Kerkez	AFC Bournemouth	DF
153	Billing	AFC Bournemouth	MC
154	David Brooks	AFC Bournemouth	MC
155	Joe Rothwell	AFC Bournemouth	MC
156	Ryan Christie	AFC Bournemouth	MC
157	Jaidon Anthony	AFC Bournemouth	DL
158	Solanke	AFC Bournemouth	DL
159	Chris Mepham	AFC Bournemouth	DF
160	Justin Kluivert	AFC Bournemouth	DL
161	Kieffer Moore	AFC Bournemouth	DL
162	James Hill	AFC Bournemouth	DF
163	Antoine Semenyo	AFC Bournemouth	DL
164	Areola	West Ham United	PT
165	Emerson	West Ham United	DF
166	Nayef Aguerd	West Ham United	DF
167	Vladimir Coufal	West Ham United	DF
168	Zouma	West Ham United	DF
169	Lucas Paquetá	West Ham United	MC
170	Pablo Fornals	West Ham United	MC
171	Tomas Soucek	West Ham United	MC
172	Antonio	West Ham United	DL
173	Benrahma	West Ham United	DL
174	Bowen	West Ham United	DL
175	Ings	West Ham United	DL
176	Thilo Kehrer	West Ham United	DF
177	Maxwel Cornet	West Ham United	DL
178	Pope	Newcastle	PT
179	Dan Burn	Newcastle	DF
180	Fabian Schär	Newcastle	DF
181	Sven Botman	Newcastle	DF
182	Trippier	Newcastle	DF
183	Bruno Guimarães	Newcastle	MC
184	Joelinton	Newcastle	MC
185	Sandro Tonali	Newcastle	MC
186	Alexander Isak	Newcastle	DL
187	Anthony Gordon	Newcastle	DL
188	Miguel Almirón	Newcastle	DL
189	Harvey Barnes	Newcastle	MC
190	Callum Wilson	Newcastle	DL
191	Longstaff	Newcastle	MC
192	Jacob Murphy	Newcastle	DL
193	Elliot Anderson	Newcastle	MC
194	Emiliano Martínez	Aston Villa	PT
195	Ezri Konsa	Aston Villa	DF
196	Lucas Digne	Aston Villa	DF
197	Matty Cash	Aston Villa	DF
198	Mings	Aston Villa	DF
199	Boubacar Kamara	Aston Villa	MC
200	Douglas Luiz	Aston Villa	MC
201	John McGinn	Aston Villa	MC
202	Leon Bailey	Aston Villa	DL
203	Moussa Diaby	Aston Villa	DL
204	Ollie Watkins	Aston Villa	DL
205	Pau Torres	Aston Villa	DF
206	Youri Tielemans	Aston Villa	MC
207	Diego Carlos	Aston Villa	DF
208	Coutinho	Aston Villa	MC
209	Jaden Philogene-Bidace	Aston Villa	DL
210	Mark Flekken	FC Brentford	PT
211	Aaron Hickey	FC Brentford	DF
212	Ethan Pinnock	FC Brentford	DF
213	Kristoffer Ajer	FC Brentford	DF
214	Nathan Collins	FC Brentford	DF
215	Rico Henry	FC Brentford	DF
216	Christian Nørgaard	FC Brentford	MC
217	Mathias Jensen	FC Brentford	MC
218	Vitaly Janelt	FC Brentford	MC
219	Bryan Mbeumo	FC Brentford	DL
220	Yoane Wissa	FC Brentford	DL
221	Mikkel Damsgaard	FC Brentford	DL
222	Mads Roerslev Rasmussen	FC Brentford	DF
223	Shandon Baptiste	FC Brentford	MC
224	Kevin Schade	FC Brentford	DL
225	Zanka	FC Brentford	DF
226	Guglielmo Vicario	Tottenham Hotspur	PT
227	Cristian Romero	Tottenham Hotspur	DF
228	Destiny Udogie	Tottenham Hotspur	DF
229	Emerson Royal	Tottenham Hotspur	DF
230	Van de Ven	Tottenham Hotspur	DF
231	James Maddison	Tottenham Hotspur	MC
232	Skipp	Tottenham Hotspur	MC
233	Yves Bissouma	Tottenham Hotspur	MC
234	Heung-Min Son	Tottenham Hotspur	DL
235	Kulusevski	Tottenham Hotspur	DL
236	Richarlison	Tottenham Hotspur	DL
237	Davinson Sánchez	Tottenham Hotspur	DF
238	Ivan Perisic	Tottenham Hotspur	MC
239	Pape Matar Sarr	Tottenham Hotspur	MC
240	Robert Sánchez	Chelsea	PT
241	Axel Disasi	Chelsea	DF
242	Chilwell	Chelsea	DF
243	Levi Colwill	Chelsea	DF
244	Reece James	Chelsea	DF
245	Thiago Silva	Chelsea	DF
246	Carney Chukwuemeka	Chelsea	MC
247	Conor Gallagher	Chelsea	MC
248	Enzo Fernández	Chelsea	MC
249	Nicolas Jackson	Chelsea	DL
250	Sterling	Chelsea	DL
251	Malo Gusto	Chelsea	DF
252	Ian Maatsen	Chelsea	DF
253	Mykhaylo Mudryk	Chelsea	DL
254	Lesley Ugochukwu	Chelsea	MC
255	Alisson	Liverpool	PT
256	Arnold	Liverpool	DF
257	Ibrahima Konaté	Liverpool	DF
258	Robertson	Liverpool	DF
259	van Dijk	Liverpool	DF
260	Alexis Mac Allister	Liverpool	MC
261	Dominik Szoboszlai	Liverpool	MC
262	Cody Gakpo	Liverpool	DL
263	Diogo Jota	Liverpool	DL
264	Luis Díaz	Liverpool	DL
265	Salah	Liverpool	DL
266	Curtis Jones	Liverpool	MC
267	Darwin Núñez	Liverpool	DL
268	Harvey Elliott	Liverpool	MC
269	André Onana	Manchester United	PT
270	Lisandro Martínez	Manchester United	DF
271	Raphaël Varane	Manchester United	DF
272	Shaw	Manchester United	DF
273	Wan-Bissaka	Manchester United	DF
274	Bruno Fernandes	Manchester United	MC
275	Casemiro	Manchester United	MC
276	Mason Mount	Manchester United	MC
277	Alejandro Garnacho	Manchester United	DL
278	Antony	Manchester United	DL
279	Rashford	Manchester United	DL
280	Lindelöf	Manchester United	DF
281	Eriksen	Manchester United	MC
282	Jadon Sancho	Manchester United	DL
283	Facundo Pellistri	Manchester United	DL
284	McTominay	Manchester United	MC
285	José Sá	Wolverhampton	PT
286	Craig Dawson	Wolverhampton	DF
287	Max Kilman	Wolverhampton	DF
288	Nélson Semedo	Wolverhampton	DF
289	Rayan Aït Nouri	Wolverhampton	DF
290	João Gomes	Wolverhampton	MC
291	Lemina	Wolverhampton	MC
292	Matheus Nunes	Wolverhampton	MC
293	Matheus Cunha	Wolverhampton	DL
294	Pablo Sarabia	Wolverhampton	DL
295	Pedro Neto	Wolverhampton	DL
296	Hee-chan Hwang	Wolverhampton	DL
297	Hugo Bueno	Wolverhampton	DF
298	Fábio Silva	Wolverhampton	DL
299	Sasa Kalajdzic	Wolverhampton	DL
314	Moussa Niakhate	Nottingham Forest	DF
322	Gustavo Hamer	Sheffield United	MC
330	Antwoine Hackford	Sheffield United	DL
342	Calvin Bassey	Fulham	DF
343	João Palhinha	Fulham	MC
345	Adama Traoré	Fulham	DL
346	Rodrigo Muniz	Fulham	DL
358	Keane Lewis-Potter	FC Brentford	DL
360	Josh Dasilva	FC Brentford	MC
374	Wataru Endo	Liverpool	MC
375	Joe Gomez	Liverpool	DF
377	Konstantinos Tsimikas	Liverpool	DF
392	Lloyd Kelly	AFC Bournemouth	DF
394	Hamed Traorè	AFC Bournemouth	MC
408	Toti Gomes	Luton Town	DF
411	Adam Webster	Burnley	DF
424	Lallana	Burnley	MC
429	Pedro Porro	Wolverhampton	DF
437	Ben Davies	Wolverhampton	DF
439	Höjbjerg	Wolverhampton	MC
441	Manor Solomon	Wolverhampton	DL
453	Diogo Dalot	Brighton & Hove Albion	DF
457	Martial	Brighton & Hove Albion	DL
462	Rúben Dias	Tottenham Hotspur	DF
467	Jack Grealish	Tottenham Hotspur	DL
484	Valentino Livramento	Manchester United	DF
499	Jhon Durán	Manchester City	DL
500	Cameron Archer	Manchester City	DL
510	Calvert-Lewin	Newcastle	DL
513	Lewis Dobbin	Newcastle	DL
515	Tyler Onyango	Newcastle	MC
523	Ward-Prowse	Aston Villa	MC
527	Ogbonna	Aston Villa	DF
529	Edson Álvarez	Aston Villa	MC
542	Moisés Caicedo	Everton	MC
543	Noni Madueke	Everton	DL
544	Mason Burstow	Everton	DL
556	Naouirou Ahamada	West Ham United	MC
557	Jesurun Rak-Sakyi	West Ham United	DL
570	Jorginho	Chelsea	MC
571	Jakub Kiwior	Chelsea	DF
572	Zinchenko	Chelsea	DF
\.


--
-- Data for Name: partidos; Type: TABLE DATA; Schema: public; Owner: -
--

COPY partidos (id, jornada, local, visitante, goles_local, goles_visitante) FROM stdin;
1	1	Burnley	Manchester City	0	3
2	1	Arsenal	Nottingham Forest	2	1
3	1	Sheffield United	Crystal Palace	0	1
4	1	Everton	Fulham	0	1
5	1	Brighton & Hove Albion	Luton Town	4	1
6	1	AFC Bournemouth	West Ham United	1	1
7	1	Newcastle	Aston Villa	5	1
8	1	FC Brentford	Tottenham Hotspur	2	2
9	1	Chelsea	Liverpool	1	1
10	1	Manchester United	Wolverhampton	1	0
11	2	Nottingham Forest	Sheffield United	2	1
12	2	Fulham	FC Brentford	0	3
13	2	Liverpool	AFC Bournemouth	3	1
14	2	Luton Town	Burnley	\N	\N
15	2	Wolverhampton	Brighton & Hove Albion	1	4
16	2	Tottenham Hotspur	Manchester United	2	0
17	2	Manchester City	Newcastle	1	0
18	2	Aston Villa	Everton	4	0
19	2	West Ham United	Chelsea	3	1
20	2	Crystal Palace	Arsenal	0	1
\.


--
-- Data for Name: resultados; Type: TABLE DATA; Schema: public; Owner: -
--

COPY resultados (id, jugador, jornada, puntos, goles, asistencias, tarjetas_amarillas, tarjetas_rojas) FROM stdin;
1	James Trafford	1	7	0	0	0	0
2	Ameen Al-Dakhil	1	2	0	0	0	0
3	Connor Roberts	1	2	0	0	0	0
4	Dara O'Shea	1	2	0	0	0	0
5	Jordan Beyer	1	4	0	0	0	0
6	Vitinho	1	1	0	0	0	0
7	Josh Cullen	1	2	0	0	0	0
8	Sander Berge	1	2	0	0	0	0
9	Luca Koleosho	1	2	0	0	0	0
10	Lyle Foster	1	2	0	0	0	0
11	Zeki Amdouni	1	4	0	0	0	0
12	Anass Zaroury	1	2	0	0	0	1
13	Jacob Bruun Larsen	1	3	0	0	0	0
14	Manuel Hedilazio	1	-1	0	0	0	0
15	Josh Brownhill	1	2	0	0	0	0
16	Redmond	1	2	0	0	0	0
17	Ederson	1	7	0	0	0	0
18	Ake	1	7	0	0	0	0
19	Kyle Walker	1	4	0	0	0	0
20	Manuel Akanji	1	5	0	0	0	0
21	Rico Lewis	1	3	0	0	0	0
22	Bernardo Silva	1	3	0	0	0	0
23	de Bruyne	1	4	0	0	0	0
24	Rodrigo	1	18	1	1	0	0
25	Erling Haaland	1	18	2	0	0	0
26	Foden	1	4	0	0	0	0
27	Julián Álvarez	1	11	0	1	0	0
28	Mateo Kovacic	1	8	0	0	0	0
29	Josko Gvardiol	1	5	0	0	0	0
30	Laporte	1	5	0	0	0	0
31	Cole Palmer	1	2	0	0	0	0
32	James McAtee	1	0	0	0	0	0
33	Ramsdale	1	3	0	0	0	0
34	Ben White	1	3	0	0	1	0
35	Jurrien Timber	1	3	0	0	1	0
36	William Saliba	1	7	0	1	0	0
37	Ødegaard	1	6	0	0	0	0
38	Rice	1	7	0	0	0	0
39	Thomas	1	7	0	0	0	0
40	Bukayo Saka	1	14	1	0	0	0
41	Edward Nketiah	1	10	1	0	0	0
42	Gabriel Martinelli	1	6	0	1	0	0
43	Kai Havertz	1	6	0	0	0	0
44	Takehiro Tomiyasu	1	4	0	0	0	0
45	Leandro Trossard	1	4	0	0	0	0
46	Gabriel Magalhães	1	2	0	0	0	0
47	Matt Turner	1	6	0	0	0	0
48	Aina	1	4	0	0	1	0
49	Aurier	1	3	0	0	0	0
50	Joe Worrall	1	3	0	0	0	0
51	Scott McKenna	1	2	0	0	0	0
52	Willy Boly	1	5	0	0	0	0
53	Brennan Johnson	1	1	0	0	0	0
54	Danilo	1	4	0	0	0	0
55	Gibbs-White	1	4	0	0	0	0
56	Orel Mangala	1	1	0	0	1	0
57	Ryan Yates	1	2	0	0	0	0
58	Taiwo Awoniyi	1	9	1	0	0	0
59	Neco Williams	1	3	0	0	0	0
60	Anthony Elanga	1	8	0	1	0	0
61	Kouyate	1	3	0	0	0	0
62	Wood	1	2	0	0	0	0
63	Wes Foderingham	1	10	0	0	0	0
64	Anel Ahmedhodzic	1	4	0	0	1	0
65	Chris Basham	1	3	0	0	0	0
66	George Baldock	1	3	0	0	0	0
67	Jack Robinson	1	3	0	0	0	0
68	John Egan	1	4	0	0	0	0
69	Max Lowe	1	6	0	0	0	0
70	Ben Osborn	1	3	0	0	0	0
71	Norwood	1	5	0	0	0	0
72	Bénie Traoré	1	1	0	0	0	0
73	William Osula	1	1	0	0	1	0
74	Yasser Larouci	1	4	0	0	0	0
75	Anis Slimane	1	2	0	0	1	0
76	Vini Souza	1	3	0	0	0	0
77	Andre Brooks	1	3	0	0	0	0
78	Sam Johnstone	1	5	0	0	0	0
79	Joachim Andersen	1	12	0	0	0	0
80	Joel Ward	1	4	0	0	0	0
81	Marc Guehi	1	8	0	0	0	0
82	Tyrick Mitchell	1	6	0	0	0	0
83	Cheick Doucouré	1	4	0	0	0	0
84	Eberechi Eze	1	11	0	0	0	0
85	Jefferson Lerma	1	8	0	0	0	0
86	Schlupp	1	5	0	0	0	0
87	Jordan Ayew	1	7	0	1	0	0
88	Odsonne Edouard	1	13	1	0	0	0
89	Tomkins	1	0	0	0	0	0
90	Pickford	1	3	0	0	0	0
91	Ashley Young	1	3	0	0	0	0
92	Michael Keane	1	6	0	0	0	0
93	Nathan Patterson	1	2	0	0	0	0
94	Tarkowski	1	4	0	0	0	0
95	Abdoulaye Doucouré	1	4	0	0	0	0
96	Amadou Onana	1	8	0	0	0	0
97	Idrissa Gueye	1	5	0	0	0	0
98	James Garner	1	6	0	0	0	0
99	Iwobi	1	8	0	0	0	0
100	Neal Maupay	1	1	0	0	0	0
101	Arnaut Danjuma	1	3	0	0	0	0
102	Bernd Leno	1	14	0	0	0	0
103	Antonee Robinson	1	6	0	0	0	0
104	Issa Diop	1	7	0	0	0	0
105	Kenny Tete	1	7	0	0	1	0
106	Tim Ream	1	5	0	0	0	0
107	Harry Wilson	1	7	0	0	0	0
108	Reed	1	5	0	0	0	0
109	Sasa Lukic	1	5	0	0	0	0
110	Tom Cairney	1	3	0	0	0	0
111	Raúl Jiménez	1	3	0	0	0	0
112	Willian	1	2	0	0	1	0
113	Bobby Reid	1	10	1	0	0	0
114	Pereira	1	4	0	0	0	0
115	Mitrovic	1	5	0	0	0	0
116	Jason Steele	1	5	0	0	0	0
117	Dunk	1	3	0	0	0	0
118	Estupiñán	1	12	0	1	1	0
119	Van Hecke	1	6	0	0	0	0
120	Groß	1	11	0	0	0	0
121	Mahmoud Dahoud	1	5	0	0	0	0
122	March	1	11	1	0	0	0
123	Milner	1	5	0	0	0	0
124	João Pedro	1	12	1	0	0	0
125	Kaoru Mitoma	1	11	0	1	1	0
126	Welbeck	1	5	0	0	0	0
127	Billy Gilmour	1	3	0	0	0	0
128	Simon Adingra	1	9	1	0	0	0
129	Evan Ferguson	1	11	1	0	0	0
130	Joël Veltman	1	1	0	0	0	0
131	Julio Enciso	1	2	0	0	0	0
132	Thomas Kaminski	1	9	0	0	0	0
133	Amari'i Bell	1	1	0	0	0	0
134	Issa Kaboré	1	4	0	0	1	0
135	Mads Andersen	1	2	0	0	1	0
136	Ryan Giles	1	3	0	0	0	0
137	Tom Lockyer	1	1	0	0	0	0
138	Marvelous Nakamba	1	2	0	0	0	0
139	Pelly-Ruddock Mpanzu	1	-1	0	0	0	0
140	Carlton Morris	1	12	1	0	0	0
141	Elijah Adebayo	1	2	0	0	0	0
142	Tahith Chong	1	1	0	0	0	0
143	Alfie Doughty	1	1	0	0	0	0
144	Jacob Brown	1	4	0	0	0	0
145	Chiedozie Ogbene	1	3	0	0	0	0
146	Luke Berry	1	2	0	0	0	0
147	Cauley Woodrow	1	5	0	0	0	0
148	Neto	1	2	0	0	0	0
149	Ilya Zabarnyi	1	2	0	0	0	0
150	Marcos Senesi	1	3	0	0	0	0
151	Max Aarons	1	4	0	0	0	0
152	Milos Kerkez	1	4	0	0	0	0
153	Billing	1	8	0	0	0	0
154	David Brooks	1	3	0	0	0	0
155	Joe Rothwell	1	5	0	0	0	0
156	Ryan Christie	1	5	0	0	0	0
157	Jaidon Anthony	1	2	0	0	0	0
158	Solanke	1	10	1	0	0	0
159	Chris Mepham	1	3	0	0	1	0
160	Justin Kluivert	1	2	0	0	0	0
161	Kieffer Moore	1	3	0	0	0	0
162	James Hill	1	3	0	0	0	0
163	Antoine Semenyo	1	4	0	0	0	0
164	Areola	1	5	0	0	0	0
165	Emerson	1	5	0	0	1	0
166	Nayef Aguerd	1	4	0	0	0	0
167	Vladimir Coufal	1	3	0	0	0	0
168	Zouma	1	4	0	0	0	0
169	Lucas Paquetá	1	10	0	0	1	0
170	Pablo Fornals	1	5	0	0	0	0
171	Tomas Soucek	1	8	0	1	0	0
172	Antonio	1	3	0	0	1	0
173	Benrahma	1	5	0	0	0	0
174	Bowen	1	13	1	0	1	0
175	Ings	1	3	0	0	0	0
176	Thilo Kehrer	1	3	0	0	0	0
177	Maxwel Cornet	1	0	0	0	0	0
178	Pope	1	6	0	0	0	0
179	Dan Burn	1	5	0	0	0	0
180	Fabian Schär	1	4	0	0	0	0
181	Sven Botman	1	8	0	1	1	0
182	Trippier	1	8	0	0	0	0
183	Bruno Guimarães	1	3	0	0	1	0
184	Joelinton	1	5	0	0	0	0
185	Sandro Tonali	1	11	1	0	1	0
186	Alexander Isak	1	16	2	0	0	0
187	Anthony Gordon	1	9	0	1	1	0
188	Miguel Almirón	1	7	0	0	0	0
189	Harvey Barnes	1	16	1	1	0	0
190	Callum Wilson	1	9	1	0	0	0
191	Longstaff	1	2	0	0	0	0
192	Jacob Murphy	1	10	0	1	0	0
193	Elliot Anderson	1	0	0	0	0	0
194	Emiliano Martínez	1	8	0	0	1	0
195	Ezri Konsa	1	0	0	0	0	0
196	Lucas Digne	1	2	0	0	1	0
197	Matty Cash	1	0	0	0	1	0
198	Mings	1	3	0	0	0	0
199	Boubacar Kamara	1	2	0	0	0	0
200	Douglas Luiz	1	5	0	0	1	0
201	John McGinn	1	1	0	0	0	0
202	Leon Bailey	1	1	0	0	0	0
203	Moussa Diaby	1	8	1	0	0	0
204	Ollie Watkins	1	10	0	1	0	0
205	Pau Torres	1	3	0	0	0	0
206	Youri Tielemans	1	2	0	0	0	0
207	Diego Carlos	1	4	0	0	0	0
208	Coutinho	1	3	0	0	0	0
209	Jaden Philogene-Bidace	1	2	0	0	0	0
210	Mark Flekken	1	5	0	0	0	0
211	Aaron Hickey	1	3	0	0	1	0
212	Ethan Pinnock	1	4	0	0	0	0
213	Kristoffer Ajer	1	2	0	0	0	0
214	Nathan Collins	1	4	0	0	0	0
215	Rico Henry	1	8	0	1	0	0
216	Christian Nørgaard	1	1	0	0	0	0
217	Mathias Jensen	1	3	0	0	0	0
218	Vitaly Janelt	1	3	0	0	0	0
219	Bryan Mbeumo	1	6	1	0	0	0
220	Yoane Wissa	1	12	1	0	0	0
221	Mikkel Damsgaard	1	4	0	0	0	0
222	Mads Roerslev Rasmussen	1	1	0	0	0	0
223	Shandon Baptiste	1	3	0	0	0	0
224	Kevin Schade	1	1	0	0	0	0
225	Zanka	1	7	0	0	0	0
226	Guglielmo Vicario	1	6	0	0	1	0
227	Cristian Romero	1	12	1	0	0	0
228	Destiny Udogie	1	6	0	0	0	0
229	Emerson Royal	1	13	1	0	0	0
230	Van de Ven	1	6	0	0	0	0
231	James Maddison	1	13	0	2	1	0
232	Skipp	1	2	0	0	1	0
233	Yves Bissouma	1	10	0	0	0	0
234	Heung-Min Son	1	3	0	0	0	0
235	Kulusevski	1	6	0	0	0	0
236	Richarlison	1	3	0	0	0	0
237	Davinson Sánchez	1	5	0	0	1	0
238	Ivan Perisic	1	5	0	0	0	0
239	Pape Matar Sarr	1	5	0	0	0	0
240	Robert Sánchez	1	4	0	0	0	0
241	Axel Disasi	1	13	1	0	0	0
242	Chilwell	1	8	0	1	0	0
243	Levi Colwill	1	6	0	0	0	0
244	Reece James	1	7	0	0	0	0
245	Thiago Silva	1	7	0	0	0	0
246	Carney Chukwuemeka	1	2	0	0	1	0
247	Conor Gallagher	1	5	0	0	0	0
248	Enzo Fernández	1	10	0	0	1	0
249	Nicolas Jackson	1	0	0	0	1	0
250	Sterling	1	3	0	0	0	0
251	Malo Gusto	1	3	0	0	0	0
252	Ian Maatsen	1	4	0	0	0	0
253	Mykhaylo Mudryk	1	4	0	0	0	0
254	Lesley Ugochukwu	1	0	0	0	0	0
255	Alisson	1	6	0	0	0	0
256	Arnold	1	2	0	0	1	0
257	Ibrahima Konaté	1	5	0	0	0	0
258	Robertson	1	6	0	0	0	0
259	van Dijk	1	5	0	0	0	0
260	Alexis Mac Allister	1	7	0	0	1	0
261	Dominik Szoboszlai	1	5	0	0	0	0
262	Cody Gakpo	1	3	0	0	0	0
263	Diogo Jota	1	4	0	0	1	0
264	Luis Díaz	1	9	1	0	0	0
265	Salah	1	8	0	1	0	0
266	Curtis Jones	1	3	0	0	0	0
267	Darwin Núñez	1	3	0	0	0	0
268	Harvey Elliott	1	5	0	0	0	0
269	André Onana	1	10	0	0	0	0
270	Lisandro Martínez	1	2	0	0	1	0
271	Raphaël Varane	1	13	1	0	0	0
272	Shaw	1	8	0	0	1	0
273	Wan-Bissaka	1	11	0	1	0	0
274	Bruno Fernandes	1	6	0	0	0	0
275	Casemiro	1	5	0	0	0	0
276	Mason Mount	1	3	0	0	0	0
277	Alejandro Garnacho	1	4	0	0	0	0
278	Antony	1	6	0	0	0	0
279	Rashford	1	4	0	0	0	0
280	Lindelöf	1	3	0	0	0	0
281	Eriksen	1	3	0	0	0	0
282	Jadon Sancho	1	3	0	0	0	0
283	Facundo Pellistri	1	4	0	0	0	0
284	McTominay	1	3	0	0	0	0
285	José Sá	1	5	0	0	0	0
286	Craig Dawson	1	11	0	0	0	0
287	Max Kilman	1	6	0	0	0	0
288	Nélson Semedo	1	7	0	0	0	0
289	Rayan Aït Nouri	1	4	0	0	1	0
290	João Gomes	1	6	0	0	0	0
291	Lemina	1	4	0	0	1	0
292	Matheus Nunes	1	7	0	0	0	0
293	Matheus Cunha	1	6	0	0	0	0
294	Pablo Sarabia	1	5	0	0	0	0
295	Pedro Neto	1	9	0	0	1	0
296	Hee-chan Hwang	1	6	0	0	0	0
297	Hugo Bueno	1	5	0	0	0	0
298	Fábio Silva	1	6	0	0	0	0
299	Sasa Kalajdzic	1	3	0	0	0	0
300	Matt Turner	2	4	0	0	0	0
301	Aurier	2	13	0	2	1	0
302	Joe Worrall	2	7	0	0	0	0
303	Neco Williams	2	2	0	0	0	0
304	Scott McKenna	2	4	0	0	0	0
305	Willy Boly	2	4	0	0	1	0
306	Brennan Johnson	2	3	0	0	0	0
307	Danilo	2	4	0	0	0	0
308	Gibbs-White	2	9	0	0	0	0
309	Orel Mangala	2	3	0	0	0	0
310	Taiwo Awoniyi	2	10	1	0	0	0
311	Ryan Yates	2	4	0	0	0	0
312	Anthony Elanga	2	2	0	0	0	0
313	Wood	2	9	1	0	0	0
314	Moussa Niakhate	2	3	0	0	0	0
315	Kouyate	2	3	0	0	0	0
316	Wes Foderingham	2	3	0	0	0	0
317	Anel Ahmedhodzic	2	4	0	0	0	0
318	Jack Robinson	2	5	0	0	0	0
319	John Egan	2	3	0	0	0	0
320	Max Lowe	2	2	0	0	0	0
321	Ben Osborn	2	2	0	0	1	0
322	Gustavo Hamer	2	11	1	0	1	0
323	Norwood	2	4	0	0	1	0
324	Vini Souza	2	6	0	0	0	0
325	Bénie Traoré	2	-1	0	0	0	0
326	William Osula	2	3	0	0	0	0
327	Yasser Larouci	2	2	0	0	0	0
328	Chris Basham	2	4	0	0	0	0
329	Andre Brooks	2	3	0	0	0	0
330	Antwoine Hackford	2	1	0	0	0	0
331	Bernd Leno	2	7	0	0	0	0
332	Antonee Robinson	2	1	0	0	0	0
333	Issa Diop	2	0	0	0	0	0
334	Kenny Tete	2	5	0	0	0	0
335	Tim Ream	2	-2	0	0	1	0
336	Bobby Reid	2	4	0	0	0	0
337	Harry Wilson	2	5	0	0	0	0
338	Pereira	2	3	0	0	0	0
339	Reed	2	4	0	0	1	0
340	Sasa Lukic	2	4	0	0	0	0
341	Raúl Jiménez	2	2	0	0	0	0
342	Calvin Bassey	2	2	0	0	0	0
343	João Palhinha	2	3	0	0	1	0
344	Willian	2	3	0	0	0	0
345	Adama Traoré	2	2	0	0	0	0
346	Rodrigo Muniz	2	2	0	0	0	0
347	Mark Flekken	2	6	0	0	0	0
348	Aaron Hickey	2	4	0	0	1	0
349	Ethan Pinnock	2	10	0	0	0	0
350	Nathan Collins	2	7	0	0	0	0
351	Rico Henry	2	5	0	0	1	0
352	Christian Nørgaard	2	5	0	0	0	0
353	Mathias Jensen	2	12	0	0	0	0
354	Vitaly Janelt	2	4	0	0	0	0
355	Bryan Mbeumo	2	17	2	0	0	0
356	Kevin Schade	2	2	0	0	0	0
357	Yoane Wissa	2	14	1	0	0	0
358	Keane Lewis-Potter	2	2	0	0	0	0
359	Mads Roerslev Rasmussen	2	3	0	0	0	0
360	Josh Dasilva	2	2	0	0	0	0
361	Mikkel Damsgaard	2	1	0	0	0	0
362	Kristoffer Ajer	2	6	0	1	0	0
363	Alisson	2	6	0	0	1	0
364	Arnold	2	6	0	0	0	0
365	Ibrahima Konaté	2	5	0	0	0	0
366	Robertson	2	7	0	0	0	0
367	van Dijk	2	8	0	0	0	0
368	Alexis Mac Allister	2	1	0	0	0	1
369	Dominik Szoboszlai	2	8	0	0	0	0
370	Cody Gakpo	2	5	0	0	0	0
371	Diogo Jota	2	14	1	0	0	0
372	Luis Díaz	2	11	1	0	0	0
373	Salah	2	6	1	0	0	0
374	Wataru Endo	2	3	0	0	0	0
375	Joe Gomez	2	3	0	0	0	0
376	Harvey Elliott	2	2	0	0	0	0
377	Konstantinos Tsimikas	2	3	0	0	0	0
378	Darwin Núñez	2	3	0	0	0	0
379	Neto	2	11	0	0	1	0
380	Ilya Zabarnyi	2	4	0	0	0	0
381	Marcos Senesi	2	3	0	0	0	0
382	Max Aarons	2	2	0	0	0	0
383	Milos Kerkez	2	3	0	0	0	0
384	Billing	2	2	0	0	0	0
385	Joe Rothwell	2	0	0	0	0	0
386	Ryan Christie	2	2	0	0	0	0
387	Antoine Semenyo	2	10	1	0	1	0
388	Jaidon Anthony	2	-2	0	0	1	0
389	Solanke	2	6	0	1	0	0
390	Justin Kluivert	2	3	0	0	0	0
391	Kieffer Moore	2	1	0	0	0	0
392	Lloyd Kelly	2	2	0	0	0	0
393	David Brooks	2	6	0	0	0	0
394	Hamed Traorè	2	7	0	0	0	0
395	José Sá	2	4	0	0	0	0
396	Craig Dawson	2	2	0	0	1	0
397	Max Kilman	2	1	0	0	1	0
398	Nélson Semedo	2	1	0	0	0	0
399	Rayan Aït Nouri	2	1	0	0	0	0
400	João Gomes	2	0	0	0	0	0
401	Lemina	2	2	0	0	0	0
402	Matheus Nunes	2	4	0	0	1	0
403	Fábio Silva	2	2	0	0	0	0
404	Matheus Cunha	2	7	0	0	0	0
405	Pedro Neto	2	4	0	0	0	0
406	Hee-chan Hwang	2	9	1	0	1	0
407	Pablo Sarabia	2	8	0	1	0	0
408	Toti Gomes	2	4	0	0	0	0
409	Hugo Bueno	2	3	0	0	0	0
410	Jason Steele	2	6	0	0	0	0
411	Adam Webster	2	4	0	0	1	0
412	Dunk	2	4	0	0	0	0
413	Estupiñán	2	16	1	1	1	0
414	Billy Gilmour	2	4	0	0	0	0
415	Groß	2	3	0	0	1	0
416	March	2	21	2	0	0	0
417	Milner	2	5	0	0	1	0
418	Julio Enciso	2	13	0	2	1	0
419	Kaoru Mitoma	2	16	1	1	0	0
420	Welbeck	2	4	0	0	0	0
421	Joël Veltman	2	5	0	0	0	0
422	João Pedro	2	4	0	0	1	0
423	Evan Ferguson	2	3	0	0	0	0
424	Lallana	2	3	0	0	0	0
425	Mahmoud Dahoud	2	3	0	0	0	0
426	Guglielmo Vicario	2	11	0	0	0	0
427	Cristian Romero	2	8	0	0	0	0
428	Destiny Udogie	2	2	0	0	1	0
429	Pedro Porro	2	5	0	0	0	0
430	Van de Ven	2	5	0	0	0	0
431	James Maddison	2	8	0	0	0	0
432	Pape Matar Sarr	2	15	1	0	0	0
433	Yves Bissouma	2	8	0	0	0	0
434	Heung-Min Son	2	9	0	0	0	0
435	Kulusevski	2	3	0	0	0	0
436	Richarlison	2	2	0	0	0	0
437	Ben Davies	2	4	0	0	0	0
438	Ivan Perisic	2	4	0	0	0	0
439	Höjbjerg	2	4	0	0	0	0
440	Emerson Royal	2	2	0	0	0	0
441	Manor Solomon	2	3	0	0	0	0
442	André Onana	2	6	0	0	0	0
443	Lisandro Martínez	2	2	0	0	0	0
444	Raphaël Varane	2	5	0	0	0	0
445	Shaw	2	8	0	0	0	0
446	Wan-Bissaka	2	3	0	0	1	0
447	Bruno Fernandes	2	9	0	0	1	0
448	Casemiro	2	4	0	0	0	0
449	Mason Mount	2	3	0	0	0	0
450	Alejandro Garnacho	2	6	0	0	0	0
451	Antony	2	6	0	0	1	0
452	Rashford	2	0	0	0	0	0
453	Diogo Dalot	2	4	0	0	0	0
454	Eriksen	2	4	0	0	0	0
455	Jadon Sancho	2	3	0	0	0	0
456	Facundo Pellistri	2	3	0	0	0	0
457	Martial	2	3	0	0	0	0
458	Ederson	2	6	0	0	0	0
459	Josko Gvardiol	2	4	0	0	0	0
460	Kyle Walker	2	6	0	0	0	0
461	Manuel Akanji	2	7	0	0	0	0
462	Rúben Dias	2	5	0	0	0	0
463	Mateo Kovacic	2	6	0	0	0	0
464	Rodrigo	2	8	0	0	0	0
465	Erling Haaland	2	5	0	0	0	0
466	Foden	2	13	0	1	0	0
467	Jack Grealish	2	5	0	0	0	0
468	Julián Álvarez	2	10	1	0	1	0
469	Pope	2	4	0	0	0	0
470	Dan Burn	2	3	0	0	0	0
471	Fabian Schär	2	4	0	0	0	0
472	Sven Botman	2	3	0	0	0	0
473	Trippier	2	7	0	0	0	0
474	Bruno Guimarães	2	3	0	0	1	0
475	Joelinton	2	4	0	0	1	0
476	Sandro Tonali	2	2	0	0	1	0
477	Alexander Isak	2	3	0	0	0	0
478	Anthony Gordon	2	2	0	0	1	0
479	Miguel Almirón	2	2	0	0	0	0
480	Harvey Barnes	2	3	0	0	1	0
481	Longstaff	2	3	0	0	0	0
482	Callum Wilson	2	2	0	0	0	0
483	Elliot Anderson	2	4	0	0	0	0
484	Valentino Livramento	2	2	0	0	0	0
485	Emiliano Martínez	2	8	0	0	0	0
486	Ezri Konsa	2	5	0	0	0	0
487	Lucas Digne	2	6	0	0	1	0
488	Matty Cash	2	6	0	0	0	0
489	Pau Torres	2	4	0	0	0	0
490	Boubacar Kamara	2	3	0	0	0	0
491	Douglas Luiz	2	11	1	0	1	0
492	John McGinn	2	11	1	0	0	0
493	Leon Bailey	2	16	1	1	0	0
494	Moussa Diaby	2	7	0	0	0	0
495	Ollie Watkins	2	4	0	0	0	0
496	Youri Tielemans	2	3	0	0	0	0
497	Diego Carlos	2	4	0	0	0	0
498	Coutinho	2	4	0	0	0	0
499	Jhon Durán	2	11	1	0	0	0
500	Cameron Archer	2	2	0	0	1	0
501	Pickford	2	0	0	0	1	0
502	Ashley Young	2	-1	0	0	0	0
503	Michael Keane	2	-2	0	0	1	0
504	Nathan Patterson	2	2	0	0	1	0
505	Tarkowski	2	3	0	0	0	0
506	Abdoulaye Doucouré	2	2	0	0	0	0
507	Amadou Onana	2	2	0	0	0	0
508	Idrissa Gueye	2	1	0	0	1	0
509	James Garner	2	5	0	0	0	0
510	Calvert-Lewin	2	2	0	0	0	0
511	Iwobi	2	1	0	0	0	0
512	Arnaut Danjuma	2	4	0	0	0	0
513	Lewis Dobbin	2	3	0	0	0	0
514	Neal Maupay	2	3	0	0	0	0
515	Tyler Onyango	2	0	0	0	0	0
516	Areola	2	9	0	0	0	0
517	Emerson	2	8	0	0	1	0
518	Nayef Aguerd	2	8	1	0	1	0
519	Vladimir Coufal	2	2	0	0	0	0
520	Zouma	2	2	0	0	0	0
521	Lucas Paquetá	2	6	1	0	1	0
522	Tomas Soucek	2	6	0	0	0	0
523	Ward-Prowse	2	10	0	2	0	0
524	Antonio	2	8	1	0	0	0
525	Benrahma	2	1	0	0	0	0
526	Bowen	2	4	0	0	0	0
527	Ogbonna	2	2	0	0	0	0
528	Pablo Fornals	2	5	0	0	0	0
529	Edson Álvarez	2	3	0	0	0	0
530	Robert Sánchez	2	2	0	0	0	0
531	Axel Disasi	2	1	0	0	1	0
532	Chilwell	2	5	0	0	0	0
533	Levi Colwill	2	3	0	0	0	0
534	Malo Gusto	2	6	0	0	0	0
535	Thiago Silva	2	4	0	0	0	0
536	Carney Chukwuemeka	2	11	1	0	1	0
537	Conor Gallagher	2	6	0	0	0	0
538	Enzo Fernández	2	8	0	0	0	0
539	Nicolas Jackson	2	6	0	0	1	0
540	Sterling	2	10	0	0	0	0
541	Mykhaylo Mudryk	2	6	0	0	0	0
542	Moisés Caicedo	2	2	0	0	0	0
543	Noni Madueke	2	4	0	0	0	0
544	Mason Burstow	2	2	0	0	0	0
545	Sam Johnstone	2	3	0	0	0	0
546	Joachim Andersen	2	6	0	0	0	0
547	Joel Ward	2	4	0	0	0	0
548	Marc Guehi	2	6	0	0	0	0
549	Tyrick Mitchell	2	4	0	0	0	0
550	Cheick Doucouré	2	4	0	0	1	0
551	Eberechi Eze	2	6	0	0	0	0
552	Jefferson Lerma	2	5	0	0	0	0
553	Schlupp	2	3	0	0	0	0
554	Jordan Ayew	2	5	0	0	1	0
555	Odsonne Edouard	2	2	0	0	0	0
556	Naouirou Ahamada	2	4	0	0	0	0
557	Jesurun Rak-Sakyi	2	4	0	0	0	0
558	Ramsdale	2	6	0	0	0	0
559	Ben White	2	6	0	0	0	0
560	Takehiro Tomiyasu	2	-1	0	0	1	0
561	William Saliba	2	9	0	0	0	0
562	Ødegaard	2	10	1	0	0	0
563	Rice	2	6	0	0	0	0
564	Thomas	2	9	0	0	0	0
565	Bukayo Saka	2	9	0	0	0	0
566	Edward Nketiah	2	3	0	0	0	0
567	Gabriel Martinelli	2	5	0	0	0	0
568	Kai Havertz	2	4	0	0	1	0
569	Gabriel Magalhães	2	4	0	0	0	0
570	Jorginho	2	3	0	0	0	0
571	Jakub Kiwior	2	2	0	0	0	0
572	Zinchenko	2	2	0	0	0	0
\.


--
-- Name: equipos_nombre_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY equipos
    ADD CONSTRAINT equipos_nombre_key UNIQUE (nombre);


--
-- Name: equipos_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY equipos
    ADD CONSTRAINT equipos_pkey PRIMARY KEY (id);


--
-- Name: jugadores_nombre_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY jugadores
    ADD CONSTRAINT jugadores_nombre_key UNIQUE (nombre);


--
-- Name: jugadores_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY jugadores
    ADD CONSTRAINT jugadores_pkey PRIMARY KEY (id);


--
-- Name: partidos_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY partidos
    ADD CONSTRAINT partidos_pkey PRIMARY KEY (id);


--
-- Name: resultados_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY resultados
    ADD CONSTRAINT resultados_pkey PRIMARY KEY (id);


--
-- Name: jugadores_equipo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY jugadores
    ADD CONSTRAINT jugadores_equipo_fkey FOREIGN KEY (equipo) REFERENCES equipos(nombre);


--
-- Name: partidos_local_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY partidos
    ADD CONSTRAINT partidos_local_fkey FOREIGN KEY (local) REFERENCES equipos(nombre);


--
-- Name: partidos_visitante_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY partidos
    ADD CONSTRAINT partidos_visitante_fkey FOREIGN KEY (visitante) REFERENCES equipos(nombre);


--
-- Name: resultados_jugador_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY resultados
    ADD CONSTRAINT resultados_jugador_fkey FOREIGN KEY (jugador) REFERENCES jugadores(nombre);


--
-- Name: public; Type: ACL; Schema: -; Owner: -
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

