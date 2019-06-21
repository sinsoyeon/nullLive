<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
 *  Copyright (c) 2015 The WebRTC project authors. All Rights Reserved.
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

    <title>Multiple peer connections</title>

    <link href="//fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet" type="text/css">

</head>

<body>

<div id="container">

    <h1><a href="//webrtc.github.io/samples/" title="WebRTC samples homepage">WebRTC samples</a> <span>Multiple peer connections</span>
    </h1>

    <video id="video1" playsinline autoplay muted></video>
    <video id="video2" playsinline autoplay></video>
    <video id="video3" playsinline autoplay></video>

    <div>
        <button id="startButton">Start</button>
        <button id="callButton">Call</button>
        <button id="hangupButton">Hang Up</button>
    </div>
</div>

<script src="https://webrtc.github.io/adapter/adapter-latest.js"></script>
<script src="${contextPath}/resources/js/streaming/connection/main.js" async></script>

</body>
</html>