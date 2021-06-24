<?xml version="1.0" encoding="UTF-8"?>
<!-- Progetto per l'esame del corso di Codifica di testi 20/21
     Studentessa: Dominga Elia 
     Matricola: 579962
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" version="1.0">
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>
                    <xsl:value-of select="//tei:titleStmt/tei:title"/>
                </title>
                <link rel="stylesheet" href="stile.css"></link>
            </head>
            <body>
                <header>
                    <ul>
                        <li><a href ="#info">Corpus</a></li>
                        <li><a href ="#c184">Cartolina 184</a></li>
                        <li><a href ="#c213">Cartolina 213</a></li>
                        <li><a href ="#about">About</a></li>
                    </ul> 
                    <h1>
                        <xsl:value-of select="//tei:titleStmt/tei:title"/>
                    </h1>
                </header>
                <div id="info">
                    <h2> Informazioni sul corpus </h2>
                    <div class="box">
                        <p> Nome corpus: <xsl:value-of select="//tei:titleStmt/tei:title"/> </p>
                        <p> Numero testi del corpus: <xsl:value-of select="count(/tei:teiCorpus/tei:TEI)"/></p>
                        <p><xsl:value-of select="tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:respStmt[2]/tei:resp"/><xsl:text>:</xsl:text>
                            <xsl:value-of select="tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:respStmt[2]/tei:name"/>
                        </p>
                        <p> Collocazione specifica: <xsl:value-of select="tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:repository"/>, 
                            <xsl:value-of select="tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:settlement"/>,
                            <xsl:value-of select="tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:country"/>
                        </p>
                        <p>Edizione: <xsl:value-of select="tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:editionStmt/tei:edition/text()"/></p>
                        <p>Editore: <xsl:value-of select="tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:publisher"/></p>
                        <p>Distribuzione da parte di: <xsl:value-of select="tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:distributor"/>, 
                            <xsl:value-of select="tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:address/tei:addrLine[1]"/></p>
                        <p>Luogo di pubblicazione:<xsl:value-of select="tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:pubPlace"/></p>
                        <p>Anno di compilazione:<xsl:value-of select="tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:editionStmt/tei:edition/tei:date"/></p>
                        <p>Anno di rilascio:<xsl:value-of select="tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:date"/></p>
                        <p>Disponibilità:<xsl:value-of select="tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:availability/tei:p"/></p>
                        <h3> Persone citate: </h3> 
                        <xsl:for-each select="tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listPerson/tei:person">
                            <p>-<xsl:value-of select="tei:persName/tei:forename"/><xsl:text> </xsl:text>
                                <xsl:if test="tei:persName/tei:forename[2]"> 
                                    <xsl:text> </xsl:text>
                                    <xsl:value-of select="tei:persName/tei:forename[2]"/>
                                </xsl:if>
                                <xsl:value-of select="tei:persName/tei:surname"/>
                                <xsl:if test="tei:occupation"> 
                                    <xsl:text> </xsl:text>
                                    <xsl:value-of select="tei:occupation"/>
                                </xsl:if>
                            </p>   
                        </xsl:for-each> 
                        <h3> Luoghi citati: </h3>
                        <xsl:for-each select="tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listPlace/tei:place">
                            <p>-<xsl:value-of select="tei:placeName"/>
                                <xsl:if test="tei:district[2]">
                                    (<xsl:value-of select="tei:district[2]"/>)
                                </xsl:if>
                            </p>   
                        </xsl:for-each>
                    </div>
                </div>
                <div id="c184">
                    <h2> Cartolina 184 </h2>
                    <xsl:apply-templates select="tei:teiCorpus/tei:TEI[1]/tei:teiHeader/tei:fileDesc/tei:titleStmt"/>
                    <div class="box">
                        <xsl:apply-templates select="tei:teiCorpus/tei:TEI[1]/tei:teiHeader"/>
                    </div>
                    <div class ="box">
                        <h4>Fronte cartolina</h4>
                        <xsl:element name="img">
                            <xsl:attribute name="src">
                                <xsl:value-of select="tei:teiCorpus/tei:TEI/tei:facsimile/tei:surface[@xml:id='C184F']/tei:graphic/@url"/>
                            </xsl:attribute>
                        </xsl:element>
                        <h4>Retro cartolina</h4>
                        <xsl:element name="img">
                            <xsl:attribute name="src">
                                <xsl:value-of select="tei:teiCorpus/tei:TEI/tei:facsimile/tei:surface[@xml:id='C184R']/tei:graphic/@url"/>
                            </xsl:attribute>
                        </xsl:element>
                    </div>
                    <h3 class="cod"> Codifica </h3>
                    <xsl:apply-templates select = "tei:teiCorpus/tei:TEI[1]/tei:teiHeader/tei:profileDesc/tei:correspDesc"/>
                    <div class="codifica">
                        <div class="sez1">
                            <p class ="n"><xsl:value-of select="tei:teiCorpus/tei:TEI[1]/tei:text/tei:body/tei:div[2]/tei:div[2]/tei:p[3]/tei:idno"/></p>
                            <p>Timbro:<xsl:value-of select="tei:teiCorpus/tei:TEI[1]/tei:text/tei:body/tei:div[2]/tei:div[2]/tei:p/tei:stamp/tei:mentioned/tei:placeName"/>
                            <xsl:value-of select="tei:teiCorpus/tei:TEI[1]/tei:text/tei:body/tei:div[2]/tei:div[2]/tei:p/tei:stamp/tei:date"/></p>
                            <p><xsl:value-of select="tei:teiCorpus/tei:TEI[1]/tei:text/tei:body/tei:div[2]/tei:div[2]/tei:p/tei:stamp[2]"/></p>
                        </div>
                        <div class="ind">
                            <p><xsl:apply-templates select="tei:teiCorpus/tei:TEI[1]/tei:text/tei:body/tei:div[2]/tei:div[2]/tei:p[2]/tei:address"/></p>
                        </div>
                        <div class="msg">
                            <p><xsl:value-of select="tei:teiCorpus/tei:TEI[1]/tei:text/tei:body/tei:div[2]/tei:div[1]/tei:opener/tei:placeName"/>
                                <xsl:value-of select="tei:teiCorpus/tei:TEI[1]/tei:text/tei:body/tei:div[2]/tei:div[1]/tei:opener/tei:w"/>
                                <xsl:value-of select="tei:teiCorpus/tei:TEI[1]/tei:text/tei:body/tei:div[2]/tei:div[1]/tei:opener/tei:date"/>
                            </p>
                            <p>
                                <xsl:for-each select="tei:teiCorpus/tei:TEI[1]/tei:text/tei:body/tei:div[2]/tei:div[1]/tei:closer/tei:salute/tei:s">
                                    <xsl:apply-templates/>
                                </xsl:for-each>
                            </p>
                        </div>
                        <div class="info">
                            <xsl:apply-templates select="tei:teiCorpus/tei:TEI[1]/tei:text/tei:body/tei:div[2]/tei:div[3]/tei:p/tei:s"/>
                            <xsl:value-of select="tei:teiCorpus/tei:TEI[1]/tei:text/tei:body/tei:div[2]/tei:div[3]/tei:p[2]/tei:idno"/>
                        </div> 
                    </div>
                </div>
                <div id="c213">
                    <h2> Cartolina 213 </h2>
                    <xsl:apply-templates select="tei:teiCorpus/tei:TEI[2]/tei:teiHeader/tei:fileDesc/tei:titleStmt"/>
                    <div class="box">
                        <xsl:apply-templates select="tei:teiCorpus/tei:TEI[2]/tei:teiHeader"/>
                    </div>
                    <div class ="box">
                        <h4>Fronte cartolina</h4>
                        <xsl:element name="img">
                            <xsl:attribute name="src">
                                <xsl:value-of select="tei:teiCorpus/tei:TEI/tei:facsimile/tei:surface[@xml:id='C213F']/tei:graphic/@url"/>
                            </xsl:attribute>
                        </xsl:element>
                        <h4>Retro cartolina</h4>
                        <xsl:element name="img">
                            <xsl:attribute name="src">
                                <xsl:value-of select="tei:teiCorpus/tei:TEI/tei:facsimile/tei:surface[@xml:id='C213R']/tei:graphic/@url"/>
                            </xsl:attribute>
                        </xsl:element>
                    </div>
                    <h3 class="cod"> Codifica </h3>
                    <xsl:apply-templates select = "tei:teiCorpus/tei:TEI[2]/tei:teiHeader/tei:profileDesc/tei:correspDesc"/>
                    <div class="codifica">
                        <div class="sez1">
                            <p class="n"><xsl:value-of select="tei:teiCorpus/tei:TEI[2]/tei:text/tei:body/tei:div[2]/tei:div[2]/tei:p[3]/tei:idno"/></p>
                            <p>Timbro:<xsl:value-of select="tei:teiCorpus/tei:TEI[2]/tei:text/tei:body/tei:div[2]/tei:div[2]/tei:p/tei:stamp/tei:mentioned/tei:placeName"/></p>
                            <p><xsl:value-of select="tei:teiCorpus/tei:TEI[2]/tei:text/tei:body/tei:div[2]/tei:div[2]/tei:p/tei:stamp[2]"/></p>
                        </div>
                        <div class="ind">
                            <p><xsl:apply-templates select="tei:teiCorpus/tei:TEI[2]/tei:text/tei:body/tei:div[2]/tei:div[2]/tei:p[2]/tei:address"/></p>
                        </div>
                        <div class="msg">
                            <p><xsl:apply-templates select="tei:teiCorpus/tei:TEI[2]/tei:text/tei:body/tei:div[2]/tei:div[1]/tei:opener/tei:placeName"/>
                                <xsl:value-of select="tei:teiCorpus/tei:TEI[2]/tei:text/tei:body/tei:div[2]/tei:div[1]/tei:opener/tei:w"/>
                                <xsl:value-of select="tei:teiCorpus/tei:TEI[2]/tei:text/tei:body/tei:div[2]/tei:div[1]/tei:opener/tei:date"/>
                            </p>
                            <p>
                                <xsl:for-each select="tei:teiCorpus/tei:TEI[2]/tei:text/tei:body/tei:div[2]/tei:div[1]/tei:closer/tei:salute/tei:s">
                                    <xsl:apply-templates/>
                                </xsl:for-each>
                            </p>
                        </div>
                        <div class="info">
                            <xsl:value-of select="tei:teiCorpus/tei:TEI[2]/tei:text/tei:body/tei:div[2]/tei:div[3]/tei:p/tei:s"/>
                            <xsl:apply-templates select="tei:teiCorpus/tei:TEI[2]/tei:text/tei:body/tei:div[2]/tei:div[3]/tei:p[2]/tei:s"/>
                        </div> 
                    </div>
                </div>
                <div id="about">
                    <div class="crediti">
                        <h2>About</h2>
                        <div class="box">
                            <p class ="nomi"><xsl:value-of select="tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:respStmt/tei:resp"/><xsl:value-of select="tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:respStmt/tei:name"/></p>
                            <xsl:for-each select="tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:editionStmt/tei:respStmt">
                                <p class ="nomi"><xsl:value-of select="tei:resp"/><xsl:text> </xsl:text><xsl:value-of select="tei:name"/></p>   
                            </xsl:for-each>
                        </div>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>

    <!-- titoli cartoline -->
    <xsl:template match="tei:teiCorpus/tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt">
        <h2><xsl:value-of select="tei:title"/></h2>
    </xsl:template>

    <!--informazioni per singola cartolina-->
    <xsl:template match="tei:teiCorpus/tei:TEI/tei:teiHeader">
        <h3 class ="tit">Descrizione</h3>
        <p>N. Identificativo: <xsl:value-of select="tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:idno"/></p>
        <p>Titolo: <xsl:value-of select="tei:fileDesc/tei:sourceDesc/tei:bibl/tei:title"/></p>
        <p>Data: <xsl:value-of select="tei:fileDesc/tei:sourceDesc/tei:bibl/tei:date"/></p>
        <p>Dimensioni:<xsl:value-of select="tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:physDesc/tei:objectDesc/tei:supportDesc/tei:support/tei:dimensions/tei:height"/>x<xsl:value-of select="//tei:TEI[2]/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:physDesc/tei:objectDesc/tei:supportDesc/tei:support/tei:dimensions/tei:width"/>cm</p>
        <p>Descrizione:<xsl:value-of select="tei:profileDesc/tei:textClass/tei:keywords/tei:term[2]"/></p>
        <p>Soggetto:<xsl:value-of select="tei:profileDesc/tei:textClass/tei:keywords/tei:term[3]"/></p>
        <p>Oggetto:<xsl:value-of select="tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:physDesc/tei:objectDesc/tei:supportDesc/tei:support/tei:objectType"/></p>
        <p>Materiale:<xsl:value-of select="tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:physDesc/tei:objectDesc/tei:supportDesc/tei:support/tei:material"/></p>
        <p>Conservazione:<xsl:value-of select="tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:physDesc/tei:objectDesc/tei:supportDesc/tei:condition"/></p>
        <p>Lingua:<xsl:value-of select="tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msContents/tei:textLang"/></p>
        <p>Note:<xsl:value-of select="tei:fileDesc/tei:notesStmt/tei:note"/></p>    
    </xsl:template>

    <!--casi gap-->
    <xsl:template match="tei:gap">
            <xsl:choose>
                <xsl:when test="./@reason='illegible'"><span class="reason">[illeggibile]</span></xsl:when>
                <xsl:when test="./@reason='cancelled'"><span class="reason">[cancellato]</span></xsl:when> 
            </xsl:choose>
	</xsl:template>

    <!--info su corrispondenza cartoline-->
    <xsl:template match="tei:teiCorpus/tei:TEI/tei:teiHeader/tei:profileDesc/tei:correspDesc">
        <p> Mittente: <xsl:value-of select ="tei:correspAction/tei:persName"/> (<xsl:value-of select ="tei:correspAction/tei:placeName"/>)</p>
        <p> Destinatario: <xsl:value-of select ="tei:correspAction[2]/tei:persName"/> (<xsl:value-of select ="tei:correspAction[2]/tei:placeName"/>) </p>
    </xsl:template>

    <!--casi choice-->
    <xsl:template match="tei:choice">
        <xsl:value-of select="tei:abbr"/> (<xsl:value-of select="tei:expan"/>)
    </xsl:template>

    <!--lb-->
    <xsl:template match="tei:lb">
        <br/>
    </xsl:template>
</xsl:stylesheet> 



