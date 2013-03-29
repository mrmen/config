<?xml version="1.0"?>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<meta content="Loggerhead/1.18.1 Python/2.6.6 Bazaar/2.5.0 Paste/1.7.5.1 PasteDeploy/1.3.3 SimpleTAL/4.1 simplejson/2.1.1" name="generator" />
<title>/emacs/elpa : contents of packages/oauth2/oauth2.el at revision 331</title>
<link href="/lh/static/css/global.css" rel="stylesheet" />

<script type="text/javascript">
var global_path = '/lh/emacs/elpa/';
var collapsed_icon_path = '/lh/static/images/treeCollapsed.png';
var expanded_icon_path = '/lh/static/images/treeExpanded.png';
</script>
<script src="/lh/static/javascript/yui/build/yui/yui-min.js" type="text/javascript"></script>
<script src="/lh/static/javascript/yui/build/oop/oop-min.js" type="text/javascript"></script>
<script src="/lh/static/javascript/yui/build/event/event-min.js" type="text/javascript"></script>
<script src="/lh/static/javascript/yui/build/attribute/attribute-min.js" type="text/javascript"></script>
<script src="/lh/static/javascript/yui/build/base/base-min.js" type="text/javascript"></script>
<script src="/lh/static/javascript/yui/build/dom/dom-min.js" type="text/javascript"></script>
<script src="/lh/static/javascript/yui/build/node/node-min.js" type="text/javascript"></script>
<script src="/lh/static/javascript/yui/build/anim/anim-min.js" type="text/javascript"></script>
<script src="/lh/static/javascript/yui/build/io/io-base-min.js" type="text/javascript"></script>
<script src="/lh/static/javascript/custom.js" type="text/javascript"></script>

<link href="/lh/static/css/annotate.css" media="all" type="text/css" rel="stylesheet" />
<link href="/lh/static/css/highlight.css" media="all" type="text/css" rel="stylesheet" />

</head>
<body>

<div id="finderBox">

<form action="/lh/emacs/elpa/changes">
<label>search:</label>
<input autocomplete="off" onblur="hide_search();" type="search" name="q" id="q" />
</form>

<div>

<a href="/lh/emacs/elpa/atom" title="RSS feed for /emacs/elpa">
<img src="/lh/static/images/ico_rss.gif" alt="RSS" class="rssfeed" />
</a>

</div>
</div>

<ul id="menuTabs">


<li><a href="/lh/emacs/elpa/changes" title="Changes">Changes</a></li>
<li><a href="/lh/emacs/elpa/files" title="Files" id="on">Files</a></li>

</ul>

<div id="loggerheadCont">
<div id="search_terms"></div>
<h1>


<span class="breadcrumb">
<a href="/lh/">(root)</a><span>/</span><a href="/lh/emacs">emacs</a><span>/</span><a href="/lh/emacs/elpa">elpa</a>
</span>

<span>: <span class="breadcrumb">
/<a href="/lh/emacs/elpa/files/331?file_id=packages-20101120161900-jv9ouqjcpswra4e7-1">packages</a>/<a href="/lh/emacs/elpa/files/331?file_id=oauth2-20110923153127-e7hskyq5gbvtqtfk-1">oauth2</a>/oauth2.el
</span> (revision 331)</span>
</h1>
<div>
<div id="branch-info">
To get this branch, use: <br />
<blockquote>
For public read access:<br />
<code>bzr branch http://bzr.savannah.gnu.org/r/emacs/elpa</code>
<br /><br />
For developer write access:<br />
<code>bzr branch bzr+ssh://yourusername@bzr.savannah.gnu.org/emacs/elpa</code>
</blockquote>
</div>
<ul id="submenuTabs">
<li id="first">
<a href="/lh/emacs/elpa/files/331">browse files</a>
</li>
<li>
<a href="/lh/emacs/elpa/revision/331">view revision</a>
</li>
<li>
<a href="/lh/emacs/elpa/changes?filter_file_id=oauth2.el-20110923153127-e7hskyq5gbvtqtfk-2">view changes to this file</a>
</li>
<li id="last">
<a href="/lh/emacs/elpa/download/head:/oauth2.el-20110923153127-e7hskyq5gbvtqtfk-2/oauth2.el">download file</a>
</li>
</ul>
<div class="annotate">
<table id="logentries">
<tr class="logheader">
<td class="annoLineTit">Line</td>
<td class="annoRevTit">Revision</td>
<td class="annoContTit">Contents</td>
</tr>
<tr class="blueRow1">
<td class="annoLine"><a id="L1" href="#L1">1</a></td>
<td class="annoRev">
<a href="/lh/emacs/elpa/revision/126" title="126 by Julien Danjou, on 23 Sep 2011 15:32 (2011-09-23 15:32:52)">126</a>
</td>
<td class="annoCont"><pre>;;; oauth2.el --- OAuth 2.0 Authorization Protocol
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L2" href="#L2">2</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L3" href="#L3">3</a></td>
<td class="annoRev">
<a href="/lh/emacs/elpa/revision/230" title="230 by Julien Danjou, on 29 May 2012 12:56 (2012-05-29 12:56:21)">230</a>
</td>
<td class="annoCont"><pre>;; Copyright (C) 2011-2012 Free Software Foundation, Inc
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L4" href="#L4">4</a></td>
<td class="annoRev">
<a href="/lh/emacs/elpa/revision/126" title="126 by Julien Danjou, on 23 Sep 2011 15:32 (2011-09-23 15:32:52)">126</a>
</td>
<td class="annoCont"><pre>
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L5" href="#L5">5</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>;; Author: Julien Danjou &lt;julien@danjou.info&gt;
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L6" href="#L6">6</a></td>
<td class="annoRev">
<a href="/lh/emacs/elpa/revision/245" title="245 by Julien Danjou, on 01 Aug 2012 10:49 (2012-08-01 10:49:42)">245</a>
</td>
<td class="annoCont"><pre>;; Version: 0.8
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L7" href="#L7">7</a></td>
<td class="annoRev">
<a href="/lh/emacs/elpa/revision/126" title="126 by Julien Danjou, on 23 Sep 2011 15:32 (2011-09-23 15:32:52)">126</a>
</td>
<td class="annoCont"><pre>;; Keywords: comm
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L8" href="#L8">8</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L9" href="#L9">9</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>;; This file is part of GNU Emacs.
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L10" href="#L10">10</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L11" href="#L11">11</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>;; GNU Emacs is free software: you can redistribute it and/or modify
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L12" href="#L12">12</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>;; it under the terms of the GNU General Public License as published by
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L13" href="#L13">13</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>;; the Free Software Foundation, either version 3 of the License, or
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L14" href="#L14">14</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>;; (at your option) any later version.
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L15" href="#L15">15</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L16" href="#L16">16</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>;; GNU Emacs is distributed in the hope that it will be useful,
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L17" href="#L17">17</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>;; but WITHOUT ANY WARRANTY; without even the implied warranty of
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L18" href="#L18">18</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L19" href="#L19">19</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>;; GNU General Public License for more details.
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L20" href="#L20">20</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L21" href="#L21">21</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>;; You should have received a copy of the GNU General Public License
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L22" href="#L22">22</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>;; along with GNU Emacs.  If not, see &lt;http://www.gnu.org/licenses/&gt;.
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L23" href="#L23">23</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L24" href="#L24">24</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>;;; Commentary:
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L25" href="#L25">25</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L26" href="#L26">26</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>;; Implementation of the OAuth 2.0 draft.
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L27" href="#L27">27</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>;;
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L28" href="#L28">28</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>;; The main entry point is `oauth2-auth-and-store&#39; which will return a token
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L29" href="#L29">29</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>;; structure. This token structure can be then used with
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L30" href="#L30">30</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>;; `oauth2-url-retrieve-synchronously&#39; to retrieve any data that need OAuth
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L31" href="#L31">31</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>;; authentication to be accessed.
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L32" href="#L32">32</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>;;
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L33" href="#L33">33</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>;; If the token needs to be refreshed, the code handles it automatically and
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L34" href="#L34">34</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>;; store the new value of the access token.
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L35" href="#L35">35</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L36" href="#L36">36</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>;;; Code:
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L37" href="#L37">37</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L38" href="#L38">38</a></td>
<td class="annoRev">
<a href="/lh/emacs/elpa/revision/245" title="245 by Julien Danjou, on 01 Aug 2012 10:49 (2012-08-01 10:49:42)">245</a>
</td>
<td class="annoCont"><pre>(require &#39;cl)
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L39" href="#L39">39</a></td>
<td class="annoRev">
<a href="/lh/emacs/elpa/revision/126" title="126 by Julien Danjou, on 23 Sep 2011 15:32 (2011-09-23 15:32:52)">126</a>
</td>
<td class="annoCont"><pre>(require &#39;plstore)
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L40" href="#L40">40</a></td>
<td class="annoRev">
<a href="/lh/emacs/elpa/revision/146" title="146 by Julien Danjou, on 08 Oct 2011 08:03 (2011-10-08 08:03:26)">146</a>
</td>
<td class="annoCont"><pre>(require &#39;json)
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L41" href="#L41">41</a></td>
<td class="annoRev">
<a href="/lh/emacs/elpa/revision/126" title="126 by Julien Danjou, on 23 Sep 2011 15:32 (2011-09-23 15:32:52)">126</a>
</td>
<td class="annoCont"><pre>
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L42" href="#L42">42</a></td>
<td class="annoRev">
<a href="/lh/emacs/elpa/revision/237" title="237 by Julien Danjou, on 25 Jun 2012 08:45 (2012-06-25 08:45:57)">237</a>
</td>
<td class="annoCont"><pre>(defun oauth2-request-authorization (auth-url client-id &amp;optional scope state redirect-uri)
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L43" href="#L43">43</a></td>
<td class="annoRev">
<a href="/lh/emacs/elpa/revision/126" title="126 by Julien Danjou, on 23 Sep 2011 15:32 (2011-09-23 15:32:52)">126</a>
</td>
<td class="annoCont"><pre>  &quot;Request OAuth authorization at AUTH-URL by launching `browse-url&#39;.
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L44" href="#L44">44</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>CLIENT-ID is the client id provided by the provider.
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L45" href="#L45">45</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>It returns the code provided by the service.&quot;
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L46" href="#L46">46</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>  (browse-url (concat auth-url
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L47" href="#L47">47</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>                      (if (string-match-p &quot;\?&quot; auth-url) &quot;&amp;&quot; &quot;?&quot;)
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L48" href="#L48">48</a></td>
<td class="annoRev">
<a href="/lh/emacs/elpa/revision/134" title="134 by Julien Danjou, on 26 Sep 2011 12:11 (2011-09-26 12:11:11)">134</a>
</td>
<td class="annoCont"><pre>                      &quot;client_id=&quot; (url-hexify-string client-id)
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L49" href="#L49">49</a></td>
<td class="annoRev">
<a href="/lh/emacs/elpa/revision/237" title="237 by Julien Danjou, on 25 Jun 2012 08:45 (2012-06-25 08:45:57)">237</a>
</td>
<td class="annoCont"><pre>                      &quot;&amp;response_type=code&quot;
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L50" href="#L50">50</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>                      &quot;&amp;redirect_uri=&quot; (url-hexify-string (or redirect-uri &quot;urn:ietf:wg:oauth:2.0:oob&quot;))
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L51" href="#L51">51</a></td>
<td class="annoRev">
<a href="/lh/emacs/elpa/revision/126" title="126 by Julien Danjou, on 23 Sep 2011 15:32 (2011-09-23 15:32:52)">126</a>
</td>
<td class="annoCont"><pre>                      (if scope (concat &quot;&amp;scope=&quot; (url-hexify-string scope)) &quot;&quot;)
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L52" href="#L52">52</a></td>
<td class="annoRev">
<a href="/lh/emacs/elpa/revision/134" title="134 by Julien Danjou, on 26 Sep 2011 12:11 (2011-09-26 12:11:11)">134</a>
</td>
<td class="annoCont"><pre>                      (if state (concat &quot;&amp;state=&quot; (url-hexify-string state)) &quot;&quot;)))
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L53" href="#L53">53</a></td>
<td class="annoRev">
<a href="/lh/emacs/elpa/revision/126" title="126 by Julien Danjou, on 23 Sep 2011 15:32 (2011-09-23 15:32:52)">126</a>
</td>
<td class="annoCont"><pre>  (read-string &quot;Enter the code your browser displayed: &quot;))
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L54" href="#L54">54</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L55" href="#L55">55</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>(defun oauth2-request-access-parse ()
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L56" href="#L56">56</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>  &quot;Parse the result of an OAuth request.&quot;
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L57" href="#L57">57</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>  (goto-char (point-min))
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L58" href="#L58">58</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>  (when (search-forward-regexp &quot;^$&quot; nil t)
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L59" href="#L59">59</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>    (json-read)))
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L60" href="#L60">60</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L61" href="#L61">61</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>(defun oauth2-make-access-request (url data)
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L62" href="#L62">62</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>  &quot;Make an access request to URL using DATA in POST.&quot;
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L63" href="#L63">63</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>  (let ((url-request-method &quot;POST&quot;)
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L64" href="#L64">64</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>        (url-request-data data)
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L65" href="#L65">65</a></td>
<td class="annoRev">
<a href="/lh/emacs/elpa/revision/133" title="133 by Julien Danjou, on 26 Sep 2011 12:08 (2011-09-26 12:08:15)">133</a>
</td>
<td class="annoCont"><pre>        (url-request-extra-headers
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L66" href="#L66">66</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>         &#39;((&quot;Content-Type&quot; . &quot;application/x-www-form-urlencoded&quot;))))
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L67" href="#L67">67</a></td>
<td class="annoRev">
<a href="/lh/emacs/elpa/revision/126" title="126 by Julien Danjou, on 23 Sep 2011 15:32 (2011-09-23 15:32:52)">126</a>
</td>
<td class="annoCont"><pre>    (with-current-buffer (url-retrieve-synchronously url)
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L68" href="#L68">68</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>      (let ((data (oauth2-request-access-parse)))
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L69" href="#L69">69</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>        (kill-buffer (current-buffer))
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L70" href="#L70">70</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>        data))))
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L71" href="#L71">71</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L72" href="#L72">72</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>(defstruct oauth2-token
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L73" href="#L73">73</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>  plstore
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L74" href="#L74">74</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>  plstore-id
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L75" href="#L75">75</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>  client-id
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L76" href="#L76">76</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>  client-secret
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L77" href="#L77">77</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>  access-token
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L78" href="#L78">78</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>  refresh-token
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L79" href="#L79">79</a></td>
<td class="annoRev">
<a href="/lh/emacs/elpa/revision/238" title="238 by Julien Danjou, on 03 Jul 2012 14:18 (2012-07-03 14:18:21)">238</a>
</td>
<td class="annoCont"><pre>  token-url
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L80" href="#L80">80</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>  access-response)
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L81" href="#L81">81</a></td>
<td class="annoRev">
<a href="/lh/emacs/elpa/revision/126" title="126 by Julien Danjou, on 23 Sep 2011 15:32 (2011-09-23 15:32:52)">126</a>
</td>
<td class="annoCont"><pre>
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L82" href="#L82">82</a></td>
<td class="annoRev">
<a href="/lh/emacs/elpa/revision/237" title="237 by Julien Danjou, on 25 Jun 2012 08:45 (2012-06-25 08:45:57)">237</a>
</td>
<td class="annoCont"><pre>(defun oauth2-request-access (token-url client-id client-secret code &amp;optional redirect-uri)
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L83" href="#L83">83</a></td>
<td class="annoRev">
<a href="/lh/emacs/elpa/revision/126" title="126 by Julien Danjou, on 23 Sep 2011 15:32 (2011-09-23 15:32:52)">126</a>
</td>
<td class="annoCont"><pre>  &quot;Request OAuth access at TOKEN-URL.
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L84" href="#L84">84</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>The CODE should be obtained with `oauth2-request-authorization&#39;.
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L85" href="#L85">85</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>Return an `oauth2-token&#39; structure.&quot;
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L86" href="#L86">86</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>  (when code
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L87" href="#L87">87</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>    (let ((result
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L88" href="#L88">88</a></td>
<td class="annoRev">
<a href="/lh/emacs/elpa/revision/133" title="133 by Julien Danjou, on 26 Sep 2011 12:08 (2011-09-26 12:08:15)">133</a>
</td>
<td class="annoCont"><pre>           (oauth2-make-access-request
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L89" href="#L89">89</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>            token-url
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L90" href="#L90">90</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>            (concat
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L91" href="#L91">91</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>             &quot;client_id=&quot; client-id
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L92" href="#L92">92</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>             &quot;&amp;client_secret=&quot; client-secret
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L93" href="#L93">93</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>             &quot;&amp;code=&quot; code
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L94" href="#L94">94</a></td>
<td class="annoRev">
<a href="/lh/emacs/elpa/revision/237" title="237 by Julien Danjou, on 25 Jun 2012 08:45 (2012-06-25 08:45:57)">237</a>
</td>
<td class="annoCont"><pre>             &quot;&amp;redirect_uri=&quot; (url-hexify-string (or redirect-uri &quot;urn:ietf:wg:oauth:2.0:oob&quot;))
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L95" href="#L95">95</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>             &quot;&amp;grant_type=authorization_code&quot;))))
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L96" href="#L96">96</a></td>
<td class="annoRev">
<a href="/lh/emacs/elpa/revision/126" title="126 by Julien Danjou, on 23 Sep 2011 15:32 (2011-09-23 15:32:52)">126</a>
</td>
<td class="annoCont"><pre>      (make-oauth2-token :client-id client-id
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L97" href="#L97">97</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>                         :client-secret client-secret
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L98" href="#L98">98</a></td>
<td class="annoRev">
<a href="/lh/emacs/elpa/revision/210" title="210 by Julien Danjou, on 04 May 2012 12:02 (2012-05-04 12:02:14)">210</a>
</td>
<td class="annoCont"><pre>                         :access-token (cdr (assoc &#39;access_token result))
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L99" href="#L99">99</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>                         :refresh-token (cdr (assoc &#39;refresh_token result))
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L100" href="#L100">100</a></td>
<td class="annoRev">
<a href="/lh/emacs/elpa/revision/238" title="238 by Julien Danjou, on 03 Jul 2012 14:18 (2012-07-03 14:18:21)">238</a>
</td>
<td class="annoCont"><pre>                         :token-url token-url
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L101" href="#L101">101</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>                         :access-response result))))
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L102" href="#L102">102</a></td>
<td class="annoRev">
<a href="/lh/emacs/elpa/revision/126" title="126 by Julien Danjou, on 23 Sep 2011 15:32 (2011-09-23 15:32:52)">126</a>
</td>
<td class="annoCont"><pre>
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L103" href="#L103">103</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>;;;###autoload
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L104" href="#L104">104</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>(defun oauth2-refresh-access (token)
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L105" href="#L105">105</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>  &quot;Refresh OAuth access TOKEN.
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L106" href="#L106">106</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>TOKEN should be obtained with `oauth2-request-access&#39;.&quot;
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L107" href="#L107">107</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>  (setf (oauth2-token-access-token token)
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L108" href="#L108">108</a></td>
<td class="annoRev">
<a href="/lh/emacs/elpa/revision/210" title="210 by Julien Danjou, on 04 May 2012 12:02 (2012-05-04 12:02:14)">210</a>
</td>
<td class="annoCont"><pre>        (cdr (assoc &#39;access_token
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L109" href="#L109">109</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>                    (oauth2-make-access-request
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L110" href="#L110">110</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>                     (oauth2-token-token-url token)
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L111" href="#L111">111</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>                     (concat &quot;client_id=&quot; (oauth2-token-client-id token)
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L112" href="#L112">112</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>                             &quot;&amp;client_secret=&quot; (oauth2-token-client-secret token)
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L113" href="#L113">113</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>                             &quot;&amp;refresh_token=&quot; (oauth2-token-refresh-token token)
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L114" href="#L114">114</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>                             &quot;&amp;grant_type=refresh_token&quot;)))))
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L115" href="#L115">115</a></td>
<td class="annoRev">
<a href="/lh/emacs/elpa/revision/126" title="126 by Julien Danjou, on 23 Sep 2011 15:32 (2011-09-23 15:32:52)">126</a>
</td>
<td class="annoCont"><pre>  ;; If the token has a plstore, update it
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L116" href="#L116">116</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>  (let ((plstore (oauth2-token-plstore token)))
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L117" href="#L117">117</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>    (when plstore
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L118" href="#L118">118</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>      (plstore-put plstore (oauth2-token-plstore-id token)
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L119" href="#L119">119</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>                   nil `(:access-token
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L120" href="#L120">120</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>                         ,(oauth2-token-access-token token)
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L121" href="#L121">121</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>                         :refresh-token
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L122" href="#L122">122</a></td>
<td class="annoRev">
<a href="/lh/emacs/elpa/revision/238" title="238 by Julien Danjou, on 03 Jul 2012 14:18 (2012-07-03 14:18:21)">238</a>
</td>
<td class="annoCont"><pre>                         ,(oauth2-token-refresh-token token)
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L123" href="#L123">123</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>                         :access-response
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L124" href="#L124">124</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>                         ,(oauth2-token-access-response token)
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L125" href="#L125">125</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>                         ))
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L126" href="#L126">126</a></td>
<td class="annoRev">
<a href="/lh/emacs/elpa/revision/126" title="126 by Julien Danjou, on 23 Sep 2011 15:32 (2011-09-23 15:32:52)">126</a>
</td>
<td class="annoCont"><pre>      (plstore-save plstore)))
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L127" href="#L127">127</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>  token)
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L128" href="#L128">128</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L129" href="#L129">129</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>;;;###autoload
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L130" href="#L130">130</a></td>
<td class="annoRev">
<a href="/lh/emacs/elpa/revision/237" title="237 by Julien Danjou, on 25 Jun 2012 08:45 (2012-06-25 08:45:57)">237</a>
</td>
<td class="annoCont"><pre>(defun oauth2-auth (auth-url token-url client-id client-secret &amp;optional scope state redirect-uri)
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L131" href="#L131">131</a></td>
<td class="annoRev">
<a href="/lh/emacs/elpa/revision/126" title="126 by Julien Danjou, on 23 Sep 2011 15:32 (2011-09-23 15:32:52)">126</a>
</td>
<td class="annoCont"><pre>  &quot;Authenticate application via OAuth2.&quot;
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L132" href="#L132">132</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>  (oauth2-request-access
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L133" href="#L133">133</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>   token-url
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L134" href="#L134">134</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>   client-id
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L135" href="#L135">135</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>   client-secret
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L136" href="#L136">136</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>   (oauth2-request-authorization
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L137" href="#L137">137</a></td>
<td class="annoRev">
<a href="/lh/emacs/elpa/revision/237" title="237 by Julien Danjou, on 25 Jun 2012 08:45 (2012-06-25 08:45:57)">237</a>
</td>
<td class="annoCont"><pre>    auth-url client-id scope state redirect-uri)
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L138" href="#L138">138</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>   redirect-uri))
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L139" href="#L139">139</a></td>
<td class="annoRev">
<a href="/lh/emacs/elpa/revision/126" title="126 by Julien Danjou, on 23 Sep 2011 15:32 (2011-09-23 15:32:52)">126</a>
</td>
<td class="annoCont"><pre>
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L140" href="#L140">140</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>(defcustom oauth2-token-file (concat user-emacs-directory &quot;oauth2.plstore&quot;)
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L141" href="#L141">141</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>  &quot;File path where store OAuth tokens.&quot;
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L142" href="#L142">142</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>  :group &#39;oauth2
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L143" href="#L143">143</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>  :type &#39;file)
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L144" href="#L144">144</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L145" href="#L145">145</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>(defun oauth2-compute-id (auth-url token-url resource-url)
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L146" href="#L146">146</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>  &quot;Compute an unique id based on URLs.
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L147" href="#L147">147</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>This allows to store the token in an unique way.&quot;
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L148" href="#L148">148</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>  (secure-hash &#39;md5 (concat auth-url token-url resource-url)))
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L149" href="#L149">149</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L150" href="#L150">150</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>;;;###autoload
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L151" href="#L151">151</a></td>
<td class="annoRev">
<a href="/lh/emacs/elpa/revision/237" title="237 by Julien Danjou, on 25 Jun 2012 08:45 (2012-06-25 08:45:57)">237</a>
</td>
<td class="annoCont"><pre>(defun oauth2-auth-and-store (auth-url token-url resource-url client-id client-secret &amp;optional redirect-uri)
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L152" href="#L152">152</a></td>
<td class="annoRev">
<a href="/lh/emacs/elpa/revision/126" title="126 by Julien Danjou, on 23 Sep 2011 15:32 (2011-09-23 15:32:52)">126</a>
</td>
<td class="annoCont"><pre>  &quot;Request access to a resource and store it using `plstore&#39;.&quot;
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L153" href="#L153">153</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>  ;; We store a MD5 sum of all URL
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L154" href="#L154">154</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>  (let* ((plstore (plstore-open oauth2-token-file))
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L155" href="#L155">155</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>         (id (oauth2-compute-id auth-url token-url resource-url))
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L156" href="#L156">156</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>         (plist (cdr (plstore-get plstore id))))
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L157" href="#L157">157</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>    ;; Check if we found something matching this access
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L158" href="#L158">158</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>    (if plist
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L159" href="#L159">159</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>        ;; We did, return the token object
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L160" href="#L160">160</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>        (make-oauth2-token :plstore plstore
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L161" href="#L161">161</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>                           :plstore-id id
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L162" href="#L162">162</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>                           :client-id client-id
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L163" href="#L163">163</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>                           :client-secret client-secret
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L164" href="#L164">164</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>                           :access-token (plist-get plist :access-token)
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L165" href="#L165">165</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>                           :refresh-token (plist-get plist :refresh-token)
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L166" href="#L166">166</a></td>
<td class="annoRev">
<a href="/lh/emacs/elpa/revision/238" title="238 by Julien Danjou, on 03 Jul 2012 14:18 (2012-07-03 14:18:21)">238</a>
</td>
<td class="annoCont"><pre>                           :token-url token-url
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L167" href="#L167">167</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>                           :access-response (plist-get plist :access-response))
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L168" href="#L168">168</a></td>
<td class="annoRev">
<a href="/lh/emacs/elpa/revision/126" title="126 by Julien Danjou, on 23 Sep 2011 15:32 (2011-09-23 15:32:52)">126</a>
</td>
<td class="annoCont"><pre>      (let ((token (oauth2-auth auth-url token-url
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L169" href="#L169">169</a></td>
<td class="annoRev">
<a href="/lh/emacs/elpa/revision/237" title="237 by Julien Danjou, on 25 Jun 2012 08:45 (2012-06-25 08:45:57)">237</a>
</td>
<td class="annoCont"><pre>                                client-id client-secret resource-url nil redirect-uri)))
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L170" href="#L170">170</a></td>
<td class="annoRev">
<a href="/lh/emacs/elpa/revision/126" title="126 by Julien Danjou, on 23 Sep 2011 15:32 (2011-09-23 15:32:52)">126</a>
</td>
<td class="annoCont"><pre>        ;; Set the plstore
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L171" href="#L171">171</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>        (setf (oauth2-token-plstore token) plstore)
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L172" href="#L172">172</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>        (setf (oauth2-token-plstore-id token) id)
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L173" href="#L173">173</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>        (plstore-put plstore id nil `(:access-token
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L174" href="#L174">174</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>                                      ,(oauth2-token-access-token token)
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L175" href="#L175">175</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>                                      :refresh-token
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L176" href="#L176">176</a></td>
<td class="annoRev">
<a href="/lh/emacs/elpa/revision/238" title="238 by Julien Danjou, on 03 Jul 2012 14:18 (2012-07-03 14:18:21)">238</a>
</td>
<td class="annoCont"><pre>                                      ,(oauth2-token-refresh-token token)
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L177" href="#L177">177</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>                                      :access-response
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L178" href="#L178">178</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>                                      ,(oauth2-token-access-response token)))
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L179" href="#L179">179</a></td>
<td class="annoRev">
<a href="/lh/emacs/elpa/revision/126" title="126 by Julien Danjou, on 23 Sep 2011 15:32 (2011-09-23 15:32:52)">126</a>
</td>
<td class="annoCont"><pre>        (plstore-save plstore)
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L180" href="#L180">180</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>        token))))
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L181" href="#L181">181</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L182" href="#L182">182</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>(defun oauth2-url-append-access-token (token url)
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L183" href="#L183">183</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>  &quot;Append access token to URL.&quot;
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L184" href="#L184">184</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>  (concat url
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L185" href="#L185">185</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>          (if (string-match-p &quot;\?&quot; url) &quot;&amp;&quot; &quot;?&quot;)
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L186" href="#L186">186</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>          &quot;access_token=&quot; (oauth2-token-access-token token)))
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L187" href="#L187">187</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L188" href="#L188">188</a></td>
<td class="annoRev">
<a href="/lh/emacs/elpa/revision/146" title="146 by Julien Danjou, on 08 Oct 2011 08:03 (2011-10-08 08:03:26)">146</a>
</td>
<td class="annoCont"><pre>;; Local variable from `url&#39;
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L189" href="#L189">189</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>;; defined here to avoid compile warning
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L190" href="#L190">190</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>(defvar success)
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L191" href="#L191">191</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L192" href="#L192">192</a></td>
<td class="annoRev">
<a href="/lh/emacs/elpa/revision/126" title="126 by Julien Danjou, on 23 Sep 2011 15:32 (2011-09-23 15:32:52)">126</a>
</td>
<td class="annoCont"><pre>;;;###autoload
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L193" href="#L193">193</a></td>
<td class="annoRev">
<a href="/lh/emacs/elpa/revision/163" title="163 by Julien Danjou, on 20 Dec 2011 10:30 (2011-12-20 10:30:30)">163</a>
</td>
<td class="annoCont"><pre>(defun oauth2-url-retrieve-synchronously (token url &amp;optional request-method request-data request-extra-headers)
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L194" href="#L194">194</a></td>
<td class="annoRev">
<a href="/lh/emacs/elpa/revision/126" title="126 by Julien Danjou, on 23 Sep 2011 15:32 (2011-09-23 15:32:52)">126</a>
</td>
<td class="annoCont"><pre>  &quot;Retrieve an URL synchronously using TOKENS to access it.
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L195" href="#L195">195</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>TOKENS can be obtained with `oauth2-auth&#39;.&quot;
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L196" href="#L196">196</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>  (let (tokens-need-renew)
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L197" href="#L197">197</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>    (flet ((url-http-handle-authentication (proxy)
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L198" href="#L198">198</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>                                           (setq tokens-need-renew t)
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L199" href="#L199">199</a></td>
<td class="annoRev">
<a href="/lh/emacs/elpa/revision/133" title="133 by Julien Danjou, on 26 Sep 2011 12:08 (2011-09-26 12:08:15)">133</a>
</td>
<td class="annoCont"><pre>                                           ;; This is to make `url&#39; think
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L200" href="#L200">200</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>                                           ;; it&#39;s done.
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L201" href="#L201">201</a></td>
<td class="annoRev">
<a href="/lh/emacs/elpa/revision/126" title="126 by Julien Danjou, on 23 Sep 2011 15:32 (2011-09-23 15:32:52)">126</a>
</td>
<td class="annoCont"><pre>                                           (setq success t)))
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L202" href="#L202">202</a></td>
<td class="annoRev">
<a href="/lh/emacs/elpa/revision/163" title="163 by Julien Danjou, on 20 Dec 2011 10:30 (2011-12-20 10:30:30)">163</a>
</td>
<td class="annoCont"><pre>      (let ((url-request-method request-method)
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L203" href="#L203">203</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>            (url-request-data request-data)
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L204" href="#L204">204</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>            (url-request-extra-headers request-extra-headers)
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L205" href="#L205">205</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>            (url-buffer))
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L206" href="#L206">206</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>        (setq url-buffer (url-retrieve-synchronously
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L207" href="#L207">207</a></td>
<td class="annoRev">
<a href="/lh/emacs/elpa/revision/230" title="230 by Julien Danjou, on 29 May 2012 12:56 (2012-05-29 12:56:21)">230</a>
</td>
<td class="annoCont"><pre>                           (oauth2-url-append-access-token token url)))
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L208" href="#L208">208</a></td>
<td class="annoRev">
<a href="/lh/emacs/elpa/revision/126" title="126 by Julien Danjou, on 23 Sep 2011 15:32 (2011-09-23 15:32:52)">126</a>
</td>
<td class="annoCont"><pre>        (if tokens-need-renew
</pre></td>
</tr><tr class="blueRow0">
<td class="annoLine"><a id="L209" href="#L209">209</a></td>
<td class="annoRev">
<a href="/lh/emacs/elpa/revision/210" title="210 by Julien Danjou, on 04 May 2012 12:02 (2012-05-04 12:02:14)">210</a>
</td>
<td class="annoCont"><pre>            (oauth2-url-retrieve-synchronously (oauth2-refresh-access token) url request-method request-data request-extra-headers)
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L210" href="#L210">210</a></td>
<td class="annoRev">
<a href="/lh/emacs/elpa/revision/126" title="126 by Julien Danjou, on 23 Sep 2011 15:32 (2011-09-23 15:32:52)">126</a>
</td>
<td class="annoCont"><pre>          url-buffer)))))
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L211" href="#L211">211</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L212" href="#L212">212</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>(provide &#39;oauth2)
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L213" href="#L213">213</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>
</pre></td>
</tr><tr class="blueRow1">
<td class="annoLine"><a id="L214" href="#L214">214</a></td>
<td class="annoRev">

</td>
<td class="annoCont"><pre>;;; oauth2.el ends here
</pre></td>
</tr>
</table>
</div>
</div>
<p class="fl">Loggerhead 1.18.1 is a web-based interface for <a href="http://bazaar-vcs.org/">Bazaar</a> branches</p>
</div>
</body>
</html>