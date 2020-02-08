<%@ Page Title="Home Page" Language="C#" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="ShoppingCart._Default" MasterPageFile="~/Main.Master" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <style type="text/css">
            .more
            {
                display:block;
            }
        </style>
        <script type="text/javascript">
            $(document).ready(function () {
                $("#buyForMe").click(function () {
                    $(this).attr("href", "BuyForMe.aspx?val=" + $("#ContentPlaceHolder1_ddlCategory").val())
                });
            });
        </script>
		<!-- Begin Slider -->
		<div id="slider">
			<div class="slider-outer">
				<div class="slider-inner shell">
					<!-- Begin Slider Items -->
					<ul class="slider-items">
						<li>
							<img src="css/images/slide-img1.jpg" alt="Slide Image 1" />
							<div class="slide-entry">
								<h2>Desktops</h2>
								<h3>Range of Desktops</h3>
								<%--<p>Maecenas eget purus arcu, in vestibulum libero. Ali-quam facilisis rhoncus eros, quis rutrum dolor tincid-unt ac. Duis vel consequat justo.</p>--%>
							</div>
							<a href="Collections.aspx?c=Desktops" class="more" title="View More">View More</a>
						</li>
						<li>
							<img src="css/images/slide-img2.jpg" alt="Slide Image 2" />
							<div class="slide-entry">
								<h2>Beds</h2>
								<h3>High Quality Beds </h3>
								<%--<p>Maecenas eget purus arcu, in vestibulum libero. Ali-quam facilisis rhoncus eros, quis rutrum dolor tincid-unt ac. Duis vel consequat justo.</p>--%>
							</div>
							<a href="Collections.aspx?c=Beds" class="more" title="View More">View More</a>
						</li>
						<li>
							<img src="css/images/slide-img3.jpg" alt="Slide Image 3" />
							<div class="slide-entry">
								<h2>Furniture</h2>
								<h3>Wide Range of Furniture </h3>
								<%--<p>Maecenas eget purus arcu, in vestibulum libero. Ali-quam facilisis rhoncus eros, quis rutrum dolor tincid-unt ac. Duis vel consequat justo.</p>--%>
							</div>
							<a href="Collections.aspx?c=Furniture" class="more" title="View More">View More</a>
						</li>
						<li>
							<img src="css/images/slide-img4.jpg" alt="Slide Image 4" />
							<div class="slide-entry">
								<h2>Laptops</h2>
								<h3>Latest Laptops at lowest prices</h3>
								<%--<p>Maecenas eget purus arcu, in vestibulum libero. Ali-quam facilisis rhoncus eros, quis rutrum dolor tincid-unt ac. Duis vel consequat justo.</p>--%>
							</div>
							<a href="Collections.aspx?c=Laptops" class="more" title="View More">View More</a>
						</li>
                        <li>
							<img src="css/images/slide-img5.jpg" alt="Slide Image 5" />
							<div class="slide-entry">
								<h2>Watches</h2>
								<h3>Best Watches for You</h3>
								<%--<p>Maecenas eget purus arcu, in vestibulum libero. Ali-quam facilisis rhoncus eros, quis rutrum dolor tincid-unt ac. Duis vel consequat justo.</p>--%>
							</div>
							<a href="Collections.aspx?c=Watches" class="more" title="View More">View More</a>
						</li>
					</ul>
					<!-- End Slider Items -->
					<div class="cl">&nbsp;</div>
					<div class="slider-controls">
						
					</div>
				</div>
			</div>
			<div class="cl">&nbsp;</div>
		</div>
		<!-- End Slider -->
		<!-- Begin Main -->
		<div id="main">
			<!-- Begin Inner -->
			<div class="inner">
				<div class="shell">
					<!-- Begin Left Sidebar -->
					<div id="left-sidebar" class="sidebar">
						<ul>
							<li class="widget">
								<h2>Categories</h2>
								<div class="widget-entry">
                                    <asp:DataList ID="dlCollections" runat="server" RepeatDirection="Vertical" Width="100%"
                                        ShowHeader="false" onitemdatabound="dlCollections_ItemDataBound" CellSpacing="0"  CellPadding="5" CssClass="dlGrid">
                                        <ItemTemplate>
                                            <asp:HyperLink ID="hyCollections" runat="server" Text='<%# Eval("cname") %>'></asp:HyperLink>
                                        </ItemTemplate>
                                    </asp:DataList>
								</div>   
							</li>
                            <li class="widget" id="cart" runat="server">
								<h2>Shopping Cart</h2>
								<div class="widget-entry">
									<a href="Cart.aspx" class="items" title="Shopping Card Items">
                                        <asp:Label ID="lblCartCount" runat="server" Text=""></asp:Label> items</a>
								</div>
							</li>
                        <asp:Panel ID="pnlPref" runat="server">
							<li class="widget select-widget">
								<h2>Brand</h2>
								<div class="widget-entry" style="padding-bottom:10px;">
									<div class="selectbox" style="display:none;">
										<span class="currentItem">--- <span>Please Select</span> ---</span>
										<div class="list">
											<ul>
												<li class="active"><a href="#" title="Please Select">Please Select</a></li>
												<li><a href="#" title="Brand 1">Brand 1</a></li>
												<li><a href="#" title="Brand 2">Brand 2</a></li>
												<li><a href="#" title="Brand 3">Brand 3</a></li>
											</ul>
										</div>
										<select>
											<option value="option" selected="selected">Please Select</option>
											<option value="option1">Brand 1</option>
											<option value="option2">Brand 2</option>
											<option value="option3">Brand 3</option>
										</select>
									</div>
									<div class="cl">&nbsp;</div>
                                    <asp:Label ID="lblBrand" runat="server" Text="Brand" CssClass="pref"></asp:Label>
								</div>
							</li>
                            <li class="widget select-widget">
								<h2>Color</h2>
								<div class="widget-entry" style="padding-bottom:10px;">
                                    <asp:Label ID="lblColor" runat="server" Text="Color" CssClass="pref"></asp:Label>
								</div>
							</li>
                            <li class="widget select-widget">
								<h2>Lower Range</h2>
								<div class="widget-entry" style="padding-bottom:10px;">
                                    <asp:Label ID="lblLowerRange" runat="server" Text="Lower Range" CssClass="pref"></asp:Label>
								</div>
							</li>
                            <li class="widget select-widget">
								<h2>Higher Range</h2>
								<div class="widget-entry" style="padding-bottom:10px;">
                                    <asp:Label ID="lblHigherRange" runat="server" Text="Higher Range" CssClass="pref"></asp:Label>
								</div>
							</li>
                            <li class="widget select-widget">
								<h2>Choose Category</h2>
								<div class="widget-entry" style="padding-bottom:10px;">
                                    <asp:DropDownList ID="ddlCategory" runat="server" CssClass="pref selectbox" style="margin-left:10px;">
                                    </asp:DropDownList>
								</div>
							</li>
                        </asp:Panel>
                            <li class="widget" id="buyForMe" runat="server" style="display:none;">
								<h2>Pick a Product</h2>
								<div class="widget-entry">
									<a href="BuyForMe.aspx" class="items" id="buyForMe" title="Lets you randomly pick a product">
                                        Buy For Me!
                                    </a>
								</div>
							</li>
						</ul>
					</div>
					<!-- End Sidebar -->
					<!-- Begin Content -->
					<div id="content">
						<!-- Begin Post -->
						<div class="post">
							<h2>Welcome to PCStore<span class="title-bottom">&nbsp;</span></h2>
							<p>
                                We are happy to introduce this site to you that likes to make your shopping experience great. 
                                Feel free to contact us at our Contact Us page.
                                We hope you will have an enjoyable experience visiting site. 
                                Do spread the word if you like this site. 
                            </p>
						</div>
						<!-- End Post -->
						<!-- Begin Products -->
						<div id="products">
							<h2>Latest Products<span class="title-bottom">&nbsp;</span></h2>
							<asp:ListView ID="dlProducts" CellPadding="0" CellSpacing="0" RepeatDirection="Vertical" 
                                ShowHeader="false" runat="server" OnItemDataBound="dlProducts_ItemDataBound">
                                <ItemTemplate>
                                    <div class="product last">
                                        <asp:HyperLink ID="hyProducts" runat="server">
                                            <asp:HiddenField ID="hdnPid" runat="server" Value='<%# Eval("pid") %>'></asp:HiddenField>
									        <span class="title">
                                                <asp:Label ID="lblProdName" runat="server" Text='<%# Eval("pname") %>'></asp:Label>
                                            </span>
                                            <asp:Image ID="prodImg" runat="server" ImageUrl='<%#Eval("pimage")%>' style="max-width:150px;max-height:150px;" />
									        <span class="price">
                                                <span>Rs.</span>
                                                <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("pprice") %>'></asp:Label>
                                            </span>
								        </asp:HyperLink>
							        </div>
                                </ItemTemplate>
                            </asp:ListView>
						</div>
						<!-- End Products -->
					</div>
					<!-- End Content -->
					<!-- Begin Right Sidebar -->
					<div id="right-sidebar" class="sidebar">
						<ul>
                            <li class="widget products-box" id="rptRec" runat="server">
								<h2>Recommended</h2>
								<div class="widget-entry">
									<ul>
                                        <asp:Repeater ID="rptRecommended" runat="server" OnItemDataBound="rptRecommended_ItemDataBound">
                                            <ItemTemplate>
                                                <li>
											        <a href='<%#Eval("pid") %>' id="hrefRec" runat="server">
												        <img src='<%#Eval("pimage")%>' id="imgRec" runat="server" alt="Product Featured Image 5" />
												        <span class="info">
													        <span class="title">
                                                                <asp:Label ID="lblProductName" runat="server" Text='<%#Eval("pname") %>'></asp:Label>
                                                            </span>
													        <span class="price">
                                                                <span>Rs.</span>
                                                                <asp:Label ID="lblPrice" runat="server" Text='<%#Eval("pprice") %>'></asp:Label>
                                                            </span>
												        </span>
												        <span class="cl">&nbsp;</span>
											        </a>
										        </li>
                                            </ItemTemplate>
                                        </asp:Repeater>					
									</ul>
									<div class="cl">&nbsp;</div>
								</div>
							</li>
							<li class="widget products-box">
								<h2>Bestsellers</h2>
								<div class="widget-entry">
									<ul>
                                        <asp:Repeater ID="rptBestsellers" runat="server" OnItemDataBound="rptBestsellers_ItemDataBound">
                                            <ItemTemplate>
                                                <li>
											        <a href='<%#Eval("pid") %>' id="hrefBestSeller" runat="server">
												        <img src='<%#Eval("pimage")%>' id="imgBestSeller" runat="server" alt=""/>
												        <span class="info">
													        <span class="title">
                                                                <asp:Label ID="lblProductNameBestSeller" runat="server" Text='<%#Eval("pname") %>'></asp:Label>
                                                            </span>
													        <span class="price">
                                                                <span>Rs.</span>
                                                                <asp:Label ID="lblPriceBestSeller" runat="server" Text='<%#Eval("pprice") %>'></asp:Label>
                                                            </span>
												        </span>
												        <span class="cl">&nbsp;</span>
											        </a>
										        </li>
                                            </ItemTemplate>
                                        </asp:Repeater>
										<%--<li>
											<a href="#" title="Side Product 1">
												<img src="css/images/side-img1.jpg" alt="Product Side Image 1" />
												<span class="info">
													<span class="title">Product Name</span>
													<span class="price"><span>$</span>117.50</span>
												</span>
												<span class="cl">&nbsp;</span>
											</a>
										</li>
										<li>
											<a href="#" title="Side Product 2">
												<img src="css/images/side-img2.jpg" alt="Product Side Image 2" />
												<span class="info">
													<span class="title">Product Name</span>
													<span class="price"><span>$</span>94.00</span>
												</span>
												<span class="cl">&nbsp;</span>
											</a>
										</li>
										<li>
											<a href="#" title="Side Product 3">
												<img src="css/images/side-img3.jpg" alt="Product Side Image 3" />
												<span class="info">
													<span class="title">Product Name</span>
													<span class="price"><span>$</span>1,175.00</span>
												</span>
												<span class="cl">&nbsp;</span>
											</a>
										</li>
										<li>
											<a href="#" title="Side Product 4">
												<img src="css/images/side-img4.jpg" alt="Product Side Image 4" />
												<span class="info">
													<span class="title">Product Name</span>
													<span class="price"><span>$</span>117.50</span>
												</span>
												<span class="cl">&nbsp;</span>
											</a>
										</li>
										<li>
											<a href="#" title="Side Product 5">
												<img src="css/images/side-img5.jpg" alt="Product Side Image 5" />
												<span class="info">
													<span class="title">Product Name</span>
													<span class="price"><span>$</span>1,175.00</span>
												</span>
												<span class="cl">&nbsp;</span>
											</a>
										</li>
										<li>
											<a href="#" title="Side Product 6">
												<img src="css/images/side-img6.jpg" alt="Product Side Image 6" />
												<span class="info">
													<span class="title">Product Name</span>
													<span class="price"><span>$</span>587.50</span>
												</span>
												<span class="cl">&nbsp;</span>
											</a>
										</li>
										<li>
											<a href="#" title="Side Product 7">
												<img src="css/images/side-img7.jpg" alt="Product Side Image 7" />
												<span class="info">
													<span class="title">Product Name</span>
													<span class="price"><span>$</span>1,175.00</span>
												</span>
												<span class="cl">&nbsp;</span>
											</a>
										</li>
										<li>
											<a href="#" title="Side Product 8">
												<img src="css/images/side-img8.jpg" alt="Product Side Image 8" />
												<span class="info">
													<span class="title">Product Name</span>
													<span class="price"><span>$</span>117.50</span>
												</span>
												<span class="cl">&nbsp;</span>
											</a>
										</li>
										<li>
											<a href="#" title="Side Product 9">
												<img src="css/images/side-img9.jpg" alt="Product Side Image 9" />
												<span class="info">
													<span class="title">Product Name</span>
													<span class="price"><span>$</span>118.68</span>
												</span>
												<span class="cl">&nbsp;</span>
											</a>
										</li>
										<li>
											<a href="#" title="Side Product 10">
												<img src="css/images/side-img10.jpg" alt="Product Side Image 10" />
												<span class="info">
													<span class="title">Product Name</span>
													<span class="price"><span>$</span>235.00</span>
												</span>
												<span class="cl">&nbsp;</span>
											</a>
										</li>--%>
									</ul>
									<div class="cl">&nbsp;</div>
								</div>
							</li>   
						</ul>
					</div>
					<!-- End Sidebar -->
					<div class="cl">&nbsp;</div>
				</div>
			</div>
			<!-- End Inner -->
		</div>
		<!-- End Main -->
</asp:Content>