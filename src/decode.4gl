
DEFINE m_puzzle1 DYNAMIC ARRAY OF STRING
TYPE t_puzzle RECORD
		c01 CHAR(2),
		c02 CHAR(2),
		c03 CHAR(2),
		c04 CHAR(2),
		c05 CHAR(2),
		c06 CHAR(2),
		c07 CHAR(2),
		c08 CHAR(2),
		c09 CHAR(2),
		c10 CHAR(2),
		c11 CHAR(2),
		c12 CHAR(2),
		c13 CHAR(2),
		c14 CHAR(2),
		c15 CHAR(2)
	END RECORD
TYPE t_puzzleColors RECORD
		c01 STRING,
		c02 STRING,
		c03 STRING,
		c04 STRING,
		c05 STRING,
		c06 STRING,
		c07 STRING,
		c08 STRING,
		c09 STRING,
		c10 STRING,
		c11 STRING,
		c12 STRING,
		c13 STRING,
		c14 STRING,
		c15 STRING
	END RECORD
DEFINE m_puzzle2 DYNAMIC ARRAY OF t_puzzle
DEFINE m_puzzle3 DYNAMIC ARRAY OF t_puzzle
DEFINE m_puzzleColors DYNAMIC ARRAY OF t_puzzleColors
DEFINE m_decode DYNAMIC ARRAY OF CHAR(1)
DEFINE m_numbers DYNAMIC ARRAY OF SMALLINT
DEFINE m_gotFreq BOOLEAN = FALSE
DEFINE m_freq DYNAMIC ARRAY OF RECORD
	num SMALLINT,
	freq SMALLINT
END RECORD
MAIN
	DEFINE x SMALLINT
	FOR x = 1 TO 26
		LET m_numbers[x] = x
		LET m_freq[x].num = x
		LET m_freq[x].freq = 0
	END FOR
	CALL setPuzzle( "10 15 14 10 22 19 ## 21 09 15 26 17 05 09 04" )
	CALL setPuzzle( "03 ## ## 03 ## 17 ## 22 ## ## 12 ## 15 ## 17" )
	CALL setPuzzle( "17 04 04 14 10 12 04 24 ## 14 06 07 14 04 16" )
	CALL setPuzzle( "05 ## ## 10 ## 23 ## 24 ## ## 15 ## 21 ## 03" )
	CALL setPuzzle( "## ## 18 14 13 12 ## 14 15 16 09 04 17 19 24" )
	CALL setPuzzle( "18 ## ## 07 ## ## ## 04 ## 09 ## ## 19 ## ##" )
	CALL setPuzzle( "12 21 06 09 19 19 08 ## 19 22 06 18 23 10 24" )
	CALL setPuzzle( "12 ## ## 24 ## 25 ## ## ## 16 ## 12 ## ## 17" )
	CALL setPuzzle( "15 14 19 12 06 22 11 ## 19 12 09 20 12 12 11" )
	CALL setPuzzle( "## ## 17 ## ## 09 ## 19 ## ## ## 12 ## ## 08" )
	CALL setPuzzle( "02 09 07 19 12 24 24 14 ## 06 14 07 11 ## ##" )
	CALL setPuzzle( "14 ## 12 ## 01 ## ## 10 ## 09 ## 07 ## ## 19" )
	CALL setPuzzle( "07 12 04 16 24 03 ## 10 14 04 02 12 24 24 17" )
	CALL setPuzzle( "17 ## 10 ## 15 ## ## 12 ## 18 ## 15 ## ## 16" )
	CALL setPuzzle( "14 05 12 15 09 24 14 15 ## 14 01 08 16 12 04" )
	LET m_decode[1] = "X"

	OPEN FORM decode FROM "decode"
	DISPLAY FORM decode

	CALL setArrays()
	LET m_gotFreq = TRUE
	DISPLAY ARRAY m_numbers TO numbers.*
		BEFORE DISPLAY EXIT DISPLAY
	END DISPLAY
	DISPLAY ARRAY m_freq TO freq.*
		BEFORE DISPLAY EXIT DISPLAY
	END DISPLAY
	INPUT ARRAY m_decode FROM alphabet.* ATTRIBUTES( WITHOUT DEFAULTS, APPEND ROW=FALSE, DELETE ROW=FALSE,INSERT ROW=FALSE )
		AFTER ROW
			CALL setArrays()
	END INPUT
END MAIN
--------------------------------------------------------------------------------------------------------------
FUNCTION setArrays()
	DEFINE l_tok base.StringTokenizer
	DEFINE x,y SMALLINT
	FOR x = 1 TO m_puzzle1.getLength()
		LET l_tok = base.StringTokenizer.create( m_puzzle1[x], " ")
		FOR y = 1 TO 15
			CASE y
				WHEN  1 LET m_puzzle2[x].c01 = l_tok.nextToken()
								LET m_puzzle3[x].c01 = decode( x, 1, m_puzzle2[x].c01 )
				WHEN  2 LET m_puzzle2[x].c02 = l_tok.nextToken()
								LET m_puzzle3[x].c02 = decode( x, 2, m_puzzle2[x].c02 )
				WHEN  3 LET m_puzzle2[x].c03 = l_tok.nextToken()
								LET m_puzzle3[x].c03 = decode( x, 3, m_puzzle2[x].c03 )
				WHEN  4 LET m_puzzle2[x].c04 = l_tok.nextToken()
								LET m_puzzle3[x].c04 = decode( x, 4, m_puzzle2[x].c04 )
				WHEN  5 LET m_puzzle2[x].c05 = l_tok.nextToken()
								LET m_puzzle3[x].c05 = decode( x, 5, m_puzzle2[x].c05 )
				WHEN  6 LET m_puzzle2[x].c06 = l_tok.nextToken()
								LET m_puzzle3[x].c06 = decode( x, 6, m_puzzle2[x].c06 )
				WHEN  7 LET m_puzzle2[x].c07 = l_tok.nextToken()
								LET m_puzzle3[x].c07 = decode( x, 7, m_puzzle2[x].c07 )
				WHEN  8 LET m_puzzle2[x].c08 = l_tok.nextToken()
								LET m_puzzle3[x].c08 = decode( x, 8, m_puzzle2[x].c08 )
				WHEN  9 LET m_puzzle2[x].c09 = l_tok.nextToken()
								LET m_puzzle3[x].c09 = decode( x, 9, m_puzzle2[x].c09 )
				WHEN 10 LET m_puzzle2[x].c10 = l_tok.nextToken()
								LET m_puzzle3[x].c10 = decode( x, 10, m_puzzle2[x].c10 )
				WHEN 11 LET m_puzzle2[x].c11 = l_tok.nextToken()
								LET m_puzzle3[x].c11 = decode( x, 11, m_puzzle2[x].c11 )
				WHEN 12 LET m_puzzle2[x].c12 = l_tok.nextToken()
								LET m_puzzle3[x].c12 = decode( x, 12, m_puzzle2[x].c12 )
				WHEN 13 LET m_puzzle2[x].c13 = l_tok.nextToken()
								LET m_puzzle3[x].c13 = decode( x, 13, m_puzzle2[x].c13 )
				WHEN 14 LET m_puzzle2[x].c14 = l_tok.nextToken()
								LET m_puzzle3[x].c14 = decode( x, 14, m_puzzle2[x].c14 )
				WHEN 15 LET m_puzzle2[x].c15 = l_tok.nextToken()
								LET m_puzzle3[x].c15 = decode( x, 15, m_puzzle2[x].c15 )
			END CASE
		END FOR
	END FOR
	DISPLAY ARRAY m_puzzle3 TO puzzle.*
		BEFORE DISPLAY
			CALL dialog.setCellAttributes( m_puzzleColors )
		 EXIT DISPLAY
	END DISPLAY
END FUNCTION
--------------------------------------------------------------------------------------------------------------
FUNCTION doFreq( n SMALLINT )
	LET m_freq[n].freq =  m_freq[n].freq + 1
	DISPLAY "Freq:",n
END FUNCTION
--------------------------------------------------------------------------------------------------------------
FUNCTION decode( x SMALLINT, y SMALLINT, l_square STRING )
	DEFINE n SMALLINT
	DEFINE l_colr STRING
	LET l_colr = "cyan"
	IF l_square = "##" THEN 
		LET l_square = " "
		LET l_colr = "blue"
	ELSE
		LET n = l_square
		IF m_decode[n] IS NOT NULL AND m_decode[n] != " " THEN
			LET l_colr = "yellow"
			LET l_square = m_decode[n]
		END IF
		IF NOT m_gotFreq THEN
			CALL doFreq( n )
		END IF
	END IF
	DISPLAY SFMT("x: %1 y: %2 n: %3 l_square: %4 l_colr: %5", x, y, n, l_square, l_colr)
	CASE y
		WHEN  1 LET m_puzzleColors[x].c01 = l_colr
		WHEN  2 LET m_puzzleColors[x].c02 = l_colr
		WHEN  3 LET m_puzzleColors[x].c03 = l_colr
		WHEN  4 LET m_puzzleColors[x].c04 = l_colr
		WHEN  5 LET m_puzzleColors[x].c05 = l_colr
		WHEN  6 LET m_puzzleColors[x].c06 = l_colr
		WHEN  7 LET m_puzzleColors[x].c07 = l_colr
		WHEN  8 LET m_puzzleColors[x].c08 = l_colr
		WHEN  9 LET m_puzzleColors[x].c09 = l_colr
		WHEN 10 LET m_puzzleColors[x].c10 = l_colr
		WHEN 11 LET m_puzzleColors[x].c11 = l_colr
		WHEN 12 LET m_puzzleColors[x].c12 = l_colr
		WHEN 13 LET m_puzzleColors[x].c13 = l_colr
		WHEN 14 LET m_puzzleColors[x].c14 = l_colr
		WHEN 15 LET m_puzzleColors[x].c15 = l_colr
	END CASE
	RETURN l_square
END FUNCTION
--------------------------------------------------------------------------------------------------------------
FUNCTION setPuzzle( l_row STRING )

	CALL m_puzzle1.appendElement()
	LET m_puzzle1[m_puzzle1.getLength()] = l_row
END FUNCTION