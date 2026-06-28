create or replace package body xxventuri.xxeba_product_quotation_pkg as

    procedure xxoeb_build_report_data (
        p_opportunity_id in number,
        p_report_data    out clob
    ) as

        v_start_tags     varchar2(500);
        v_end_tags       varchar2(500);
        v_report_data    clob;
        v_milestone_data clob;
        v_s_no           number;
        cursor get_product_details is
        select
            dp.id,
            dp.product_price,
            dp.currency_type,
            p.product_name product,
            p.minimum_order_quantity,
            p.unit_of_measure
        from
            eba_sales_deal_products dp,
            eba_sales_products      p
        where
                dp.deal_id = p_opportunity_id
            and dp.product_id = p.id
        order by
            dp.updated desc;

        product_details  get_product_details%rowtype;
    begin
        v_start_tags := '<?xml version="1.0" encoding="UTF-8"?> 
						<DOCUMENT> 
						<ROWSET> 
						<ROW>';
        v_end_tags := '</ROW> 
						</ROWSET> 
						</DOCUMENT>'; 
						 
		/*v_report_data	:= '<QUANTITY>10</QUANTITY> 
							<DESCRIPTION>Test</DESCRIPTION> 
							<RATE>1000</RATE> 
							<AMOUNT>10000</AMOUNT>'; */
        v_s_no := 1; 
		--v_invoice_total := 0; 
        open get_product_details;
        loop
            fetch get_product_details into product_details;
            exit when get_product_details%notfound;
            v_milestone_data := v_milestone_data
                                || '<PRODUCT_DATA> 
										<S_NO>'
                                || v_s_no
                                || '</S_NO> 
										<PRODUCT>'
                                || product_details.product
                                || '</PRODUCT> 
										<PRICE>'
                                || to_char(
                nvl(product_details.product_price, 0),
                '9,999,999,999.99'
            )
                                || '</PRICE>
                                        <MOQ>'
                                || product_details.minimum_order_quantity
                                || ' '
                                || product_details.unit_of_measure
                                || '</MOQ>';

            v_milestone_data := v_milestone_data || '</PRODUCT_DATA>';
            v_s_no := v_s_no + 1;
        end loop;

        close get_product_details;
        p_report_data := v_start_tags
                         || v_milestone_data
                         || v_end_tags;
    end xxoeb_build_report_data;

    procedure xxoeb_build_report_layout (
        p_report_layout out clob
    ) as
        v_start_layout  varchar2(4000);
        v_end_layout    varchar2(8000);
        v_report_layout clob;
    begin
        v_start_layout := '<?xml version="1.0"?> 
							<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format"> 
								<xsl:template match="/"> 
									<fo:root> 
										<fo:layout-master-set> 
											<fo:simple-page-master master-name="default-page" page-height="11in" page-width="8.5in"  
											        margin-left="0.6in" margin-right="0.6in" margin-top="1.79in" margin-bottom="0.79in"> 
												<fo:region-body/> 
											</fo:simple-page-master> 
										</fo:layout-master-set>';
        v_end_layout := '</fo:root> 
						</xsl:template>	 
						 
						<xsl:template match="p"> 
							<fo:block> 
								<xsl:text>&#xA0;</xsl:text> 
							</fo:block> 
							<fo:block> 
								<xsl:apply-templates/> 
							</fo:block> 
						</xsl:template> 
						 
						<xsl:template match="b"> 
							<fo:inline font-weight="bold"> 
								<xsl:apply-templates select="*|text()"/> 
							</fo:inline> 
						</xsl:template> 
						 
						<xsl:template match="i"> 
							<fo:inline font-style="italic"> 
								<xsl:apply-templates select="*|text()"/> 
							</fo:inline> 
						</xsl:template> 
						 
						<xsl:template match="u"> 
							<fo:inline text-decoration="underline"> 
								<xsl:apply-templates select="*|text()"/> 
							</fo:inline> 
						</xsl:template> 
						 
						<xsl:template match="strong"> 
							<fo:inline font-weight="bold"> 
								<xsl:apply-templates select="*|text()"/> 
							</fo:inline> 
						</xsl:template> 
						 
						<xsl:template match="big"> 
							<fo:inline font-size="120%"> 
								<xsl:apply-templates select="*|text()"/> 
							</fo:inline> 
						</xsl:template> 
						 
						<xsl:template match="small"> 
							<fo:inline font-size="80%"> 
								<xsl:apply-templates select="*|text()"/> 
							</fo:inline> 
						</xsl:template>	 
						 
						<xsl:template match="a">							 
							<fo:inline> 
								<fo:basic-link color="blue"> 
									<xsl:attribute name="external-destination"> 
										<xsl:value-of select="@href"/> 
									</xsl:attribute> 
									<xsl:value-of select="." /> 
								</fo:basic-link> 
							</fo:inline> 
						</xsl:template>  
						 
						<xsl:template match="img">							 
							<fo:block> 
								<fo:external-graphic  
									background="transparent" 
									content-width="scale-down-to-fit" 
									content-height="scale-down-to-fit"  
									scaling="uniform"  
									src="{@src}"> 
								<xsl:if test="@width"> 
									<xsl:attribute name="width"> 
										<xsl:choose> 
											<xsl:when test="contains(@width, ''px'')"> 
												<xsl:value-of select="concat(@width, ''pt'')"/> 
											</xsl:when> 
										<xsl:otherwise> 
											<xsl:value-of select="concat(@width, ''pt'')"/> 
										</xsl:otherwise> 
										</xsl:choose> 
									</xsl:attribute> 
								</xsl:if> 
								<xsl:if test="@height"> 
									<xsl:attribute name="height"> 
										<xsl:choose> 
											<xsl:when test="contains(@height, ''px'')"> 
												<xsl:value-of select="concat(@height, ''pt'')"/> 
											</xsl:when> 
										<xsl:otherwise> 
											<xsl:value-of select="concat(@height, ''pt'')"/> 
										</xsl:otherwise> 
										</xsl:choose> 
									</xsl:attribute> 
								</xsl:if>  
								</fo:external-graphic> 
							</fo:block> 
						</xsl:template> 
						 
						<xsl:template match="ol"> 
							<fo:block> 
								<xsl:text>&#xA0;</xsl:text> 
							</fo:block> 
						  <fo:list-block provisional-distance-between-starts="0.8cm" 
							provisional-label-separation="0.5cm"> 
							<xsl:attribute name="space-after"> 
							  <xsl:choose> 
								<xsl:when test="ancestor::ul or ancestor::ol"> 
								  <xsl:text>0pt</xsl:text> 
								</xsl:when> 
								<xsl:otherwise> 
								  <xsl:text>12pt</xsl:text> 
								</xsl:otherwise> 
							  </xsl:choose> 
							</xsl:attribute> 
							<xsl:attribute name="start-indent"> 
							  <xsl:variable name="ancestors"> 
								<xsl:choose> 
								  <xsl:when test="count(ancestor::ol) or count(ancestor::ul)"> 
									<xsl:value-of select="1 +  
														  (count(ancestor::ol) +  
														   count(ancestor::ul)) *  
														  1.25"/> 
								  </xsl:when> 
								  <xsl:otherwise> 
									<xsl:text>1</xsl:text> 
								  </xsl:otherwise> 
								</xsl:choose> 
							  </xsl:variable> 
							  <xsl:value-of select="concat($ancestors, ''cm'')"/> 
							</xsl:attribute> 
							<xsl:apply-templates select="*"/> 
						  </fo:list-block> 
						</xsl:template> 
  
						<xsl:template match="ol/li"> 
						  <fo:list-item space-after="1.5em"> 
							<fo:list-item-label end-indent="label-end()"> 
							  <fo:block> 
								<xsl:variable name="value-attr"> 
								  <xsl:choose> 
									<xsl:when test="../@start"> 
									  <xsl:number value="position() + ../@start - 1"/> 
									</xsl:when> 
									<xsl:otherwise> 
									  <xsl:number value="position()"/> 
									</xsl:otherwise> 
								  </xsl:choose> 
								</xsl:variable> 
								<xsl:choose> 
								  <xsl:when test="../@type=''i''"> 
									<xsl:number value="$value-attr" format="i. "/> 
								  </xsl:when> 
								  <xsl:when test="../@type=''I''"> 
									<xsl:number value="$value-attr" format="I. "/> 
								  </xsl:when> 
								  <xsl:when test="../@type=''a''"> 
									<xsl:number value="$value-attr" format="a. "/> 
								  </xsl:when> 
								  <xsl:when test="../@type=''A''"> 
									<xsl:number value="$value-attr" format="A. "/> 
								  </xsl:when> 
								  <xsl:otherwise> 
									<xsl:number value="$value-attr" format="1. "/> 
								  </xsl:otherwise> 
								</xsl:choose> 
							  </fo:block> 
							</fo:list-item-label> 
							<fo:list-item-body start-indent="body-start()"> 
							  <fo:block> 
								<xsl:apply-templates select="*|text()"/> 
							  </fo:block> 
							</fo:list-item-body>  
						  </fo:list-item> 
						</xsl:template> 
						 
						<xsl:template match="ul"> 
							<fo:block> 
								<xsl:text>&#xA0;</xsl:text> 
							</fo:block> 
						  <fo:list-block provisional-distance-between-starts="0.8cm" 
							provisional-label-separation="0.5cm"> 
							<xsl:attribute name="space-after"> 
							  <xsl:choose> 
								<xsl:when test="ancestor::ul or ancestor::ol"> 
								  <xsl:text>0pt</xsl:text> 
								</xsl:when> 
								<xsl:otherwise> 
								  <xsl:text>12pt</xsl:text> 
								</xsl:otherwise> 
							  </xsl:choose> 
							</xsl:attribute> 
							<xsl:attribute name="start-indent"> 
							  <xsl:variable name="ancestors"> 
								<xsl:choose> 
								  <xsl:when test="count(ancestor::ol) or count(ancestor::ul)"> 
									<xsl:value-of select="1 +  
														  (count(ancestor::ol) +  
														   count(ancestor::ul)) *  
														  1.25"/> 
								  </xsl:when> 
								  <xsl:otherwise> 
									<xsl:text>1</xsl:text> 
								  </xsl:otherwise> 
								</xsl:choose> 
							  </xsl:variable> 
							  <xsl:value-of select="concat($ancestors, ''cm'')"/> 
							</xsl:attribute> 
							<xsl:apply-templates select="*"/> 
						  </fo:list-block> 
						</xsl:template> 
  
						<xsl:template match="ul/li"> 
						  <fo:list-item space-after="1.5em"> 
							<fo:list-item-label end-indent="label-end()"> 
							  <fo:block> 
								<fo:inline font-size="14pt" font-weight="bold">&#x2022;</fo:inline> 
							  </fo:block> 
							</fo:list-item-label> 
							<fo:list-item-body start-indent="body-start()"> 
							  <fo:block> 
								<xsl:apply-templates select="*|text()"/> 
							  </fo:block> 
							</fo:list-item-body> 
						  </fo:list-item> 
						</xsl:template> 
						 
					</xsl:stylesheet>';
        v_report_layout := '<fo:page-sequence master-reference="default-page"> 
							<fo:flow flow-name="xsl-region-body"> 
							 
								<fo:block> 
									<fo:block text-align="center"> 
										<fo:block padding-bottom="5mm"> 
											<fo:inline font-size="22.5pt" font-weight="bold" color="#000"> 
												<xsl:text>INVOICE</xsl:text> 
											</fo:inline> 
										</fo:block> 
									</fo:block> 
								</fo:block> 
								 
								<fo:block> 
									<fo:block text-align="start" line-height="5mm"> 
										<xsl:text>MVT/Q/15-16</xsl:text>  
									</fo:block> 
									<fo:block text-align="start" line-height="5mm"> 
										<xsl:text>Luk India Ltd</xsl:text>  
									</fo:block> 
									<fo:block text-align="start" line-height="5mm"> 
										<xsl:text>Royakotta Road</xsl:text>  
									</fo:block> 
									<fo:block text-align="start" line-height="5mm"> 
										<xsl:text>Hosur – 635109</xsl:text>  
									</fo:block> 
									<fo:block text-align="start" line-height="5mm"> 
										<xsl:text>Tamil Nadu</xsl:text>  
									</fo:block> 
								</fo:block> 
								 
								<fo:block> 
									<fo:block text-align="start" line-height="5mm"> 
										<xsl:text>Kind attn.: Mr. Rammurthy</xsl:text>  
									</fo:block>	 
								</fo:block> 
								 
								<fo:block> 
									<fo:block text-align="start" line-height="5mm"> 
										<xsl:text>Dear Sir,</xsl:text>  
									</fo:block>	 
								</fo:block> 
								 
								<fo:block> 
									<fo:block text-align="start" line-height="5mm"> 
										<xsl:text>Sub: Quotation for Special Tools</xsl:text>  
									</fo:block>	 
								</fo:block> 
								 
								<fo:block> 
									<fo:block text-align="start" line-height="5mm"> 
										<xsl:text>We would like to offer our competitive price for the following slitting cutter and insert from Taegutec India P Ltd;</xsl:text>  
									</fo:block>	 
								</fo:block> 
								 
								 
								<fo:table border-color="#c1c1c1" border-style="solid" border-width="1pt" height="17cm"> 
									<fo:table-column column-width="2.5cm" border-color="#c1c1c1" border-style="solid" border-width="1pt"/> 
									<fo:table-column column-width="10cm" border-color="#c1c1c1" border-style="solid" border-width="1pt"/> 
									<fo:table-column column-width="3cm" border-color="#c1c1c1" border-style="solid" border-width="1pt"/> 
									<fo:table-column column-width="2cm" border-color="#c1c1c1" border-style="solid" border-width="1pt"/> 
									 
									<fo:table-body font-family="sans-serif" font-weight="normal" font-size="10pt"> 
										 
										<fo:table-row line-height="12pt"> 
											<fo:table-cell border-width="1pt" border-color="#c1c1c1" border-style="solid" padding="6pt"> 
												<fo:block text-align="center">S.No</fo:block> 
											</fo:table-cell> 
											<fo:table-cell border-width="1pt" border-color="#c1c1c1" border-style="solid" padding="4pt"> 
												<fo:block text-align="center">Item</fo:block> 
											</fo:table-cell> 
											<fo:table-cell border-width="1pt" border-color="#c1c1c1" border-style="solid" padding="3pt"> 
												<fo:block text-align="center">Price/Unit (Rs.)</fo:block> 
											</fo:table-cell> 
											<fo:table-cell border-width="1pt" border-color="#c1c1c1" border-style="solid" padding="2pt"> 
												<fo:block text-align="center">MOQ</fo:block> 
											</fo:table-cell> 
										</fo:table-row> 
																			 
										<xsl:for-each select="DOCUMENT/ROWSET/ROW/PRODUCT_DATA"> 
											<fo:table-row line-height="0.5cm"> 
												<fo:table-cell padding="2pt"  padding-top="0.5cm"> 
													<fo:block text-align="center"> 
													<xsl:value-of select="S_NO"/> 
													</fo:block> 
												</fo:table-cell> 
												<fo:table-cell padding="2pt"  padding-top="0.5cm"> 
													<fo:block text-align="start"> 
													<xsl:value-of select="PRODUCT"/> 
													</fo:block> 
												</fo:table-cell> 
												<fo:table-cell padding="2pt"  padding-top="0.5cm"> 
													<fo:block text-align="end"> 
													<xsl:value-of select="PRICE"/> 
													</fo:block> 
												</fo:table-cell> 
												<fo:table-cell padding="2pt"  padding-top="0.5cm"> 
													<fo:block text-align="start"> 
													<xsl:value-of select="MOQ"/> 
													</fo:block> 
												</fo:table-cell> 
											</fo:table-row> 
											 
										</xsl:for-each>	 
											 
									</fo:table-body> 
									 
								</fo:table> 
								 
								<fo:block> 
									<fo:block text-align="start" line-height="5mm"> 
										<xsl:text>Terms & Conditions:</xsl:text>  
									</fo:block> 
								</fo:block> 
								 
								<fo:block-container height="17cm" width="19cm" top="1cm" left="0cm" position="absolute"> 
									 
									<fo:table border-color="#c1c1c1" border-style="solid" border-width="1pt"> 
										<fo:table-column column-width="5cm" border-color="#c1c1c1" border-style="solid" border-width="0pt"/> 
										<fo:table-column column-width="14cm" border-color="#c1c1c1" border-style="solid" border-width="0pt"/> 
										 
										<fo:table-body font-family="sans-serif" font-weight="normal" font-size="10pt"> 
											<fo:table-row line-height="1cm" border-width="1pt" border-color="#c1c1c1" border-style="solid"> 
												<fo:table-cell border-width="1pt" border-color="#c1c1c1" border-style="solid" padding="6pt"> 
													<fo:block text-align="center">Excise Duty:</fo:block> 
												</fo:table-cell> 
												<fo:table-cell border-width="1pt" border-color="#c1c1c1" border-style="solid" padding="6pt"> 
													<fo:block text-align="center">Extra as applicable Cenvat GP will be provided</fo:block> 
												</fo:table-cell> 
											</fo:table-row> 
											 
											<fo:table-row line-height="1cm" border-width="1pt" border-color="#c1c1c1" border-style="solid"> 
												<fo:table-cell border-width="1pt" border-color="#c1c1c1" border-style="solid" padding="6pt"> 
													<fo:block text-align="center">Sales Tax:</fo:block> 
												</fo:table-cell> 
												<fo:table-cell border-width="1pt" border-color="#c1c1c1" border-style="solid" padding="6pt"> 
													<fo:block text-align="center">5% extra as applicable</fo:block> 
												</fo:table-cell> 
											</fo:table-row> 
											 
											<fo:table-row line-height="1cm" border-width="1pt" border-color="#c1c1c1" border-style="solid"> 
												<fo:table-cell border-width="1pt" border-color="#c1c1c1" border-style="solid" padding="6pt"> 
													<fo:block text-align="center">Payment:</fo:block> 
												</fo:table-cell> 
												<fo:table-cell border-width="1pt" border-color="#c1c1c1" border-style="solid" padding="6pt"> 
													<fo:block text-align="center">Immediate</fo:block> 
												</fo:table-cell> 
											</fo:table-row> 
											 
											<fo:table-row line-height="1cm" border-width="1pt" border-color="#c1c1c1" border-style="solid"> 
												<fo:table-cell border-width="1pt" border-color="#c1c1c1" border-style="solid" padding="6pt"> 
													<fo:block text-align="center">Delivery:</fo:block> 
												</fo:table-cell> 
												<fo:table-cell border-width="1pt" border-color="#c1c1c1" border-style="solid" padding="6pt"> 
													<fo:block text-align="center">4 weeks after receiving your Purchase Order</fo:block> 
												</fo:table-cell> 
											</fo:table-row> 
											 
											<fo:table-row line-height="1cm" border-width="1pt" border-color="#c1c1c1" border-style="solid"> 
												<fo:table-cell border-width="1pt" border-color="#c1c1c1" border-style="solid" padding="6pt"> 
													<fo:block text-align="center">Validity :</fo:block> 
												</fo:table-cell> 
												<fo:table-cell border-width="1pt" border-color="#c1c1c1" border-style="solid" padding="6pt"> 
													<fo:block text-align="center">Subject to change with prior intimation</fo:block> 
												</fo:table-cell> 
											</fo:table-row> 
											 
										</fo:table-body> 
										 
									</fo:table> 
																	 
								</fo:block-container> 
								 
								<fo:block> 
									<fo:block text-align="start" line-height="5mm"> 
										<xsl:text>Thanking you and awaiting for your favourable orders.</xsl:text>  
									</fo:block> 
								</fo:block> 
								 
								<fo:block> 
									<fo:block text-align="start" line-height="5mm"> 
										<xsl:text>Yours truly,</xsl:text>  
									</fo:block> 
									<fo:block text-align="start" line-height="5mm"> 
										<xsl:text>For Msk Venturi Tools</xsl:text>  
									</fo:block> 
									<fo:block text-align="start" line-height="5mm"> 
										<xsl:text>Se. Rajan</xsl:text>  
									</fo:block> 
									<fo:block text-align="start" line-height="5mm"> 
										<xsl:text>9442290266</xsl:text>  
									</fo:block> 
									 
								</fo:block> 
 
							</fo:flow> 
						</fo:page-sequence>';
        p_report_layout := v_start_layout
                           || v_report_layout
                           || v_end_layout;
    end xxoeb_build_report_layout;

    function xxeba_product_amount (
        p_order_id in varchar2
    ) return varchar2 is
        over_all_amount varchar2(50);
    begin
        select
            sum(amount)
        into over_all_amount
        from
            (
                select
                    so.order_id,
                    so.deal_id,
                    ( p.product_price * p.quantity ) as amount
                from
                    xxeba_sales_order    so,
                    eba_sales_deals      sd,
                    eba_sales_customers  sc,
                    eba_sales_salesreps  sr,
                    xxeba_order_products p
                where
                        so.deal_id = sd.id
                    and so.customer_id = sc.id
                    and so.sales_rep = sr.id
                    and p.order_id = so.order_id
            )
        where
            order_id = p_order_id;

        return over_all_amount;
    exception
        when others then
            raise_application_error(-20001, 'An error was encountered - '
                                            || sqlcode
                                            || ' -ERROR- '
                                            || sqlerrm);
    end;

end xxeba_product_quotation_pkg;
/


-- sqlcl_snapshot {"hash":"0d93a830264fd7db20f978b6244b6175cd200666","type":"PACKAGE_BODY","name":"XXEBA_PRODUCT_QUOTATION_PKG","schemaName":"XXVENTURI","sxml":""}