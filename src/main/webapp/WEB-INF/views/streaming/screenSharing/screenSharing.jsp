<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
 *  Copyright (c) 2018 The WebRTC project authors. All Rights Reserved.
 *
 *  Use of this source code is governed by a BSD-style license
 *  that can be found in the LICENSE file in the root of the source
 *  tree.
-->
<html>
<head>

  <meta charset="utf-8">
  <meta name="description" content="WebRTC code samples">
  <meta name="viewport" content="width=device-width, user-scalable=yes, initial-scale=1, maximum-scale=1">
  <meta itemprop="description" content="Client-side WebRTC code samples">
  <meta itemprop="name" content="WebRTC code samples">
  <meta name="mobile-web-app-capable" content="yes">
  <meta id="theme-color" name="theme-color" content="#ffffff">

  <base target="_blank">

  <title>getDisplayMedia</title>

  <link href="//fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet" type="text/css">
  <script src="https://unpkg.com/@webcomponents/webcomponentsjs/webcomponents-loader.js"></script>

</head>

<body>

  <div id="container">
    <h1><a href="//webrtc.github.io/samples/" title="WebRTC samples homepage">WebRTC samples</a> <span>Demo of getDisplayMedia and screen recording</span></h1>

    <h4>Screen capturing is currently an experimental feature which is only supported by latest Chrome and Firefox!</h4>
    <p>To enable this feature in Chrome, toggle the Experimental Web Platform feature (See chrome://flags/#enable-experimental-web-platform-features).</p>
    <screen-sharing></screen-sharing>

    <p>Display the screensharing stream from <code>getDisplayMedia()</code> in a video element and record the stream.</p>
	<video id="videoC" playsinline autoplay></video>
    <a href="https://github.com/webrtc/samples/tree/gh-pages/src/content/getusermedia/getdisplaymedia" title="View source for this page on GitHub" id="viewSource">View source on GitHub</a>
  </div>

  <script src="${contextPath}/resources/js/streaming/screenStream/main.js" type="module"></script>

</body>
</html>