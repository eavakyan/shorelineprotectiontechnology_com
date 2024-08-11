<?xml version="1.0" encoding="UTF-8"?><xsl:stylesheet
	version="2.0"
	xmlns="http://www.w3.org/1999/xhtml"
	xmlns:html="http://www.w3.org/TR/html40"
	xmlns:video="http://www.google.com/schemas/sitemap-video/1.1"
	xmlns:sitemap="http://www.sitemaps.org/schemas/sitemap/0.9"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
>
	<xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>

	<xsl:template match="/">
	<xsl:variable name="fileType">
		<xsl:choose>
			<xsl:when test="//sitemap:url">Sitemap</xsl:when>
			<xsl:otherwise>SitemapIndex</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<html xmlns="http://www.w3.org/1999/xhtml">
		<head>
			<title>
				<xsl:choose>
					<xsl:when test="$fileType='Sitemap'">Video Sitemap</xsl:when>
					<xsl:otherwise>Video Sitemap Index</xsl:otherwise>
				</xsl:choose>
			</title>
			<meta name="viewport" content="width=device-width, initial-scale=1" />
			<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
			<style type="text/css">
	body {
		margin: 0;
		font-family: Helvetica, Arial, sans-serif;
		font-size: 68.5%;
	}
	#content-head {
		background-color: #141B38;
		padding: 20px 40px;
	}
	#content-head h1,
	#content-head p,
	#content-head a {
		color: #fff;
		font-size: 1.2em;
	}
	#content-head h1 {
		font-size: 2em;
	}
	table {
		margin: 20px 40px;
		border: none;
		border-collapse: collapse;
		font-size: 1em;
		width: 75%;
	}
	th {
		border-bottom: 1px solid #ccc;
		text-align: left;
		padding: 15px 5px;
		font-size: 14px;
	}
	td {
		padding: 10px 5px;
		border-left: 3px solid #fff;
	}
	tr.stripe {
		background-color: #f7f7f7;
	}
	table td a:not(.localized) {
		display: block;
	}
	table td a img {
		max-height: 30px;
		margin: 6px 3px;
	}
	.empty-sitemap {
		margin: 20px 40px;
		width: 75%;
	}
	.empty-sitemap__title {
		font-size: 18px;
		line-height: 125%;
		margin: 12px 0;
	}
	.empty-sitemap svg {
		width: 140px;
		height: 140px;
	}
	.empty-sitemap__buttons {
		margin-bottom: 30px;
	}
	.empty-sitemap__buttons .button {
		margin-right: 5px;
	}
	.breadcrumb {
		margin: 20px 40px;
		width: 75%;

		display: flex;
		align-items: center;
		font-size: 12px;
		font-weight: 600;
	}
	.breadcrumb a {
		color: #141B38;
		text-decoration: none;
	}
	.breadcrumb svg {
		margin: 0 10px;
	}
	@media (max-width: 1023px) {
		.breadcrumb svg:not(.back),
		.breadcrumb a:not(:last-of-type),
		.breadcrumb span {
			display: none;
		}
		.breadcrumb a:last-of-type::before {
			content: 'Back'
		}
	}
	@media (min-width: 1024px) {
		.breadcrumb {
			font-size: 14px;
		}
		.breadcrumb a {
			font-weight: 400;
		}
		.breadcrumb svg.back {
			display: none;
		}
	}
</style>
						<style>
				.modal-window {
					position: fixed;
					background-color: rgba(20, 27, 56, 0.3);
					top: 0;
					right: 0;
					bottom: 0;
					left: 0;
					z-index: 999;
					visibility: hidden;
					opacity: 0;
					pointer-events: none;
					transition: all 0.3s;
				}
				.modal-window .title {
					font-weight: bold;
					font-size: 18px;
					line-height: 120%;
					color: #141B38;
					max-width: 80%;
					margin: 0 auto 10px;
				}
				.modal-window .link {
					font-weight: 600;
					font-size: 14px;
					color: #005AE0;
					text-decoration-line: underline;
				}
				.modal-window:target {
					visibility: visible;
					opacity: 1;
					pointer-events: auto;
				}
				.modal-window > div {
					width: 80%;
					max-width: 700px;
					position: absolute;
					top: 50%;
					left: 50%;
					transform: translate(-50%, -50%);
					padding: 24px;
					background: #FFFFFF;
					box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
				}
				.modal-close {
					position: absolute;
					right: 10px;
					top: 10px;
					text-decoration: none;
					padding: 15px;
					transition: opacity .2s ease-in-out;
				}
				.modal-close:hover {
					opacity: 0.7;
				}
				.videos-column {
					display: flex;
					align-items: center;
				}
				.videos-column .open-modal {
					color: #141B38;
					font-size: 13px;
				}
				.videos {
					display: flex;
					align-items: center;
				}
				.videos img {
					max-width: 48px;
					max-height: 100%;
					margin-right: 8px;
					margin-left: 0;
				}
				.modal-window .videos {
					margin-top: 32px;
					display: grid;
					grid-gap: 8px;
					grid-template-columns: repeat(3,minmax(0,1fr));
					overflow-y: auto;
					max-height: 50vh;
				}
				.modal-window .videos img {
					max-width: 100%;
					margin-right: 0;
				}

				@media (min-width: 1024px) {
					.modal-window .title {
						max-width: 100%;
					}
					.modal-close {
						right: 20px;
						top: 20px;
						padding: 20px;
					}
					.modal-window .title {
						font-size: 20px;
					}
					.modal-window .link {
						font-size: 16px;
					}
					.modal-window > div {
						padding: 40px;
					}
					.modal-window .videos {
						grid-gap: 24px;
						grid-template-columns: repeat(5,minmax(0,1fr));
						overflow-y: hidden;
    					max-height: initial;
					}
				}
			</style>
		</head>
		<body>
			<xsl:variable name="amountOfURLs">
				<xsl:choose>
					<xsl:when test="$fileType='Sitemap'">
						<xsl:value-of select="count(sitemap:urlset/sitemap:url)"></xsl:value-of>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="count(sitemap:sitemapindex/sitemap:sitemap)"></xsl:value-of>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>

			<xsl:call-template name="Header">
				<xsl:with-param name="title">Video Sitemap</xsl:with-param>
				<xsl:with-param name="amountOfURLs" select="$amountOfURLs"/>
				<xsl:with-param name="fileType" select="$fileType"/>
			</xsl:call-template>

			<div class="content">
				<div class="container">
					<xsl:choose>
						<xsl:when test="$amountOfURLs = 0"><xsl:call-template name="emptySitemap"/></xsl:when>
						<xsl:when test="$fileType='Sitemap'"><xsl:call-template name="sitemapTable"/></xsl:when>
						<xsl:otherwise><xsl:call-template name="siteindexTable"/></xsl:otherwise>
					</xsl:choose>
				</div>
			</div>
		</body>
	</html>
	</xsl:template>

	<xsl:template name="siteindexTable">
		<div class="breadcrumb">
	<svg class="back" width="6" height="9" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M5.274 7.56L2.22 4.5l3.054-3.06-.94-.94-4 4 4 4 .94-.94z" fill="#141B38"/></svg>

	<a href="./index.html"><span>Home</span></a>

			<svg width="6" height="8" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M.727 7.06L3.78 4 .727.94l.94-.94 4 4-4 4-.94-.94z" fill="#141B38"/></svg>

					<span>Video Sitemap Index</span>
				</div>		<div class="table-wrapper">
			<table cellpadding="3">
				<thead>
				<tr>
					<th class="left">
						<a href="">
							URL						</a>
					</th>
					<th>URL Count</th>
					<th>
						Last Updated					</th>
				</tr>
				</thead>
				<tbody>
				<xsl:variable name="lower" select="'abcdefghijklmnopqrstuvwxyz'"/>
				<xsl:variable name="upper" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'"/>
				<xsl:for-each select="sitemap:sitemapindex/sitemap:sitemap">
										<tr>
						<xsl:if test="position() mod 2 != 1">
							<xsl:attribute name="class">stripe</xsl:attribute>
						</xsl:if>
						<td class="left">
							<a>
								<xsl:attribute name="href">
									<xsl:value-of select="sitemap:loc" />
								</xsl:attribute>
								<xsl:value-of select="sitemap:loc"/>
							</a>
						</td>
						<td>
													</td>
						<td class="datetime">
													</td>
					</tr>
				</xsl:for-each>
				</tbody>
			</table>
		</div>
	</xsl:template>

	<xsl:template name="sitemapTable">
		<xsl:variable name="sitemapType">
			<xsl:for-each select="/*/namespace::*">
				<xsl:if test="name()='video'">
					<xsl:choose>
						<xsl:when test="name()='video'">video</xsl:when>
					</xsl:choose>
				</xsl:if>
			</xsl:for-each>
		</xsl:variable>

		<div class="breadcrumb">
	<svg class="back" width="6" height="9" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M5.274 7.56L2.22 4.5l3.054-3.06-.94-.94-4 4 4 4 .94-.94z" fill="#141B38"/></svg>

	<a href="./index.html"><span>Home</span></a>

			<svg width="6" height="8" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M.727 7.06L3.78 4 .727.94l.94-.94 4 4-4 4-.94-.94z" fill="#141B38"/></svg>

					<a href="video-sitemap.xml"><span>Video Sitemap Index</span></a>
						<svg width="6" height="8" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M.727 7.06L3.78 4 .727.94l.94-.94 4 4-4 4-.94-.94z" fill="#141B38"/></svg>

					<span>Video Sitemap</span>
				</div>		<div class="table-wrapper">
			<table cellpadding="3">
				<thead>
				<tr>
					<th class="left">
						<a href="">
							URL						</a>
					</th>
					<th>Video</th>
					<th class="left">Video Thumbnail</th>
					<th>
						Last Updated					</th>
				</tr>
				</thead>
				<tbody>
				<xsl:variable name="lower" select="'abcdefghijklmnopqrstuvwxyz'"/>
				<xsl:variable name="upper" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'"/>
				<xsl:for-each select="sitemap:urlset/sitemap:url">
										<tr>
						<xsl:if test="position() mod 2 != 1">
							<xsl:attribute name="class">stripe</xsl:attribute>
						</xsl:if>
						<td class="left">
							<a>
								<xsl:attribute name="href">
									<xsl:value-of select="sitemap:loc" />
								</xsl:attribute>
								<xsl:value-of select="sitemap:loc"/>
							</a>
						</td>
						<xsl:if test="$sitemapType='video'">
							<td>
								<div class="item-count">
									<xsl:value-of select="count(video:video)"/>
								</div>
							</td>
							<td>
								<xsl:if test="$sitemapType='video'">
									<div class="videos-column">
										<div class="videos">
											<xsl:for-each select="video:video">
												<xsl:if test="position() &lt;= 2">
													<xsl:variable name="thumbURL">
														<xsl:value-of select="video:thumbnail_loc"/>
													</xsl:variable>
													<xsl:variable name="playURL">
														<xsl:value-of select="video:player_loc"/>
													</xsl:variable>
													<xsl:if test="$thumbURL != ''">
														<a href="{$playURL}" target="_new"><img src="{$thumbURL}"/></a>
													</xsl:if>
												</xsl:if>
											</xsl:for-each>
										</div>
										<xsl:if test="count(video:video) &gt; 2">
											<a class="open-modal">
												<xsl:attribute name="href">
													<xsl:value-of select="concat('#modal-', position())" />
												</xsl:attribute>
												+<xsl:value-of select="count(video:video)-2" />
											</a>
											<div class="modal-window">
												<xsl:attribute name="id">
													<xsl:value-of select="concat('modal-', position())" />
												</xsl:attribute>
												<div>
													<a href="#" title="Close" class="modal-close">
														<svg width="15" height="15" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M14.667 1.91L13.257.5l-5.59 5.59L2.077.5.667 1.91l5.59 5.59-5.59 5.59 1.41 1.41 5.59-5.59 5.59 5.59 1.41-1.41-5.59-5.59 5.59-5.59z" fill="#8C8F9A"/></svg>
													</a>
													<div class="title">
														There are <xsl:value-of select="count(video:video)"/> videos at the following URL:													</div>
													<a class="link">
														<xsl:attribute name="href">
															<xsl:value-of select="sitemap:loc" />
														</xsl:attribute>
														<xsl:value-of select="sitemap:loc"/>
													</a>
													<div class="videos">
														<xsl:for-each select="video:video">
															<xsl:variable name="thumbURL">
																<xsl:value-of select="video:thumbnail_loc"/>
															</xsl:variable>
															<xsl:variable name="playURL">
																<xsl:value-of select="video:player_loc"/>
															</xsl:variable>
															<xsl:if test="$thumbURL != ''">
																<a href="{$playURL}" target="_new"><img src="{$thumbURL}"/></a>
															</xsl:if>
														</xsl:for-each>
													</div>
												</div>
											</div>
										</xsl:if>
									</div>
								</xsl:if>
							</td>
						</xsl:if>
						<td class="datetime">
													</td>
					</tr>
				</xsl:for-each>
				</tbody>
			</table>
		</div>
			</xsl:template>

	<xsl:template name="Header">
	<xsl:param name="title"/>
	<xsl:param name="amountOfURLs"/>
	<xsl:param name="fileType"/>

	<div id="content-head">
		<h1><xsl:value-of select="$title"/></h1>
		<xsl:choose>
			<xsl:when test="$fileType='RSS'">
				<p>Generated by <a href="https://aioseo.com/?utm_source=WordPress&#038;utm_campaign=proplugin&#038;utm_medium=video-sitemap" target="_blank" rel="noreferrer noopener">All in One SEO Pro</a>, this is an RSS Sitemap, meant to be consumed by search engines like Google or Bing.</p>
				<p>
					You can find more information about RSS Sitemaps at <a href="https://www.sitemaps.org/" target="_blank" rel="noreferrer noopener">sitemaps.org</a>.				</p>
			</xsl:when>
			<xsl:otherwise>
				<p>Generated by <a href="https://aioseo.com/?utm_source=WordPress&#038;utm_campaign=proplugin&#038;utm_medium=video-sitemap" target="_blank" rel="noreferrer noopener">All in One SEO Pro</a>, this is an XML Sitemap, meant to be consumed by search engines like Google or Bing.</p>
				<p>
					You can find more information about XML Sitemaps at <a href="https://www.sitemaps.org/" target="_blank" rel="noreferrer noopener">sitemaps.org</a>.				</p>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:if test="$amountOfURLs &gt; 0">
			<p>
				<xsl:choose>
					<xsl:when test="$fileType='Sitemap' or $fileType='RSS'">
						This sitemap contains						<xsl:value-of select="$amountOfURLs"/>
						<xsl:choose>
							<xsl:when test="$amountOfURLs = 1">
								URL							</xsl:when>
							<xsl:otherwise>
								URLs							</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:otherwise>
						This sitemap index contains						<xsl:value-of select="$amountOfURLs"/>
						<xsl:choose>
							<xsl:when test="$amountOfURLs = 1">
								sitemap							</xsl:when>
							<xsl:otherwise>
								sitemaps							</xsl:otherwise>
						</xsl:choose>
					</xsl:otherwise>
				</xsl:choose>
				and was generated on August 11, 2024 at 6:42 pm			</p>
		</xsl:if>
	</div>
</xsl:template>
	<xsl:template name="emptySitemap">
	<div class="breadcrumb">
	<svg class="back" width="6" height="9" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M5.274 7.56L2.22 4.5l3.054-3.06-.94-.94-4 4 4 4 .94-.94z" fill="#141B38"/></svg>

	<a href="./index.html"><span>Home</span></a>

			<svg width="6" height="8" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M.727 7.06L3.78 4 .727.94l.94-.94 4 4-4 4-.94-.94z" fill="#141B38"/></svg>

					<span>Video Sitemap Index</span>
				</div>	<div class="empty-sitemap">
		<h2 class="empty-sitemap__title">
			Whoops!			<br />
			There are no posts here		</h2>
		<div class="empty-sitemap__buttons">
			<a href="./index.html" class="button">Back to Homepage</a>
					</div>

			</div>
	<style>
		.hand-magnifier{
			animation: hand-magnifier .8s infinite ease-in-out;
			transform-origin: center 90%;
			transform-box: fill-box;
		}
		@keyframes hand-magnifier {
			0% {
				transform: rotate(0deg);
			}
			50% {
				transform: rotate(-12deg);
			}
			100% {
				transform: rotate(0deg);
			}
		}
	</style>
</xsl:template>
</xsl:stylesheet>