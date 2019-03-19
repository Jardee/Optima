
*** ZLECENIA SERWISOWE ***



USE CDN3;

SELECT 
CDN.SrsZlecenia.SrZ_NumerPelny AS 'Numer Zlecenia',
CASE
	WHEN CDN.SrsZlecenia.SrZ_Bufor = 0
		THEN 'Nie'
		ELSE 'Tak'
	END AS 'Czy w Buforze',
CDN.Kontrahenci.Knt_Kod AS 'Kontrahent',
CDN.SrsZlecenia.SrZ_TS_Zal AS 'Data Za�o�enia',
CDN.SrsZlecenia.SrZ_DataPrzyjecia AS 'Data Przyj�cia',
CDN.SrsZlecenia.SrZ_DataRealizacji AS 'Data Realizacji',
CDN.SrsZlecenia.SrZ_DataZamkniecia AS 'Data Zamkni�cia',
CDN.SrsZlecenia.SrZ_EtapOpis AS 'Etap',
CDN.SrsZlecenia.SrZ_Stan AS 'Etap',
CDN.SrsZlecenia.SrZ_Opis AS 'Opis',
CDN.SrsZlecenia.SrZ_WartoscNetto AS 'Warto�� Netto',
CAST(CDN.SrsZlecenia.SrZ_CzasRealizacjiCzynnosci / 60 as varchar(10))  + ' h' AS 'Czas Realizacji Czynno�ci',
CDN.SrsZlecenia.SrZ_OpeZalKod AS 'Kto Za�o�y�',
CDN.SrsZlecenia.SrZ_OpeModKod AS 'Kto Ostatnio Modyfikowa�'
FROM CDN.SrsZlecenia 
	JOIN 
		CDN.Kontrahenci ON CDN.SrsZlecenia.SrZ_PodmiotId = CDN.Kontrahenci.Knt_KntId
WHERE CDN.SrsZlecenia.SrZ_TS_Zal > CAST(YEAR(getdate()) AS varchar(4)) + '-01-01 00:00:00.000';