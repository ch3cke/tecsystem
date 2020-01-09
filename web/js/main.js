! function(window) {
	"use strict";

	function walkDomTree(t, e) {
		if (1 === t.nodeType)
			for (var o = t.firstChild; o;) 1 === o.nodeType && (e(o), walkDomTree(o, e)), o = o.nextSibling
	}

	function getElementsByClassName(t, e) {
		var o = [];
		return walkDomTree(t, function(t) {
			for (var n = "string" == typeof t.className ? t.className.split(/\s/) : [], i = 0; i < n.length; ++i) n[i] === e &&
				o.push(t)
		}), o
	}

	function elementText(t, e) {
		var o = "string" == typeof t.textContent ? "textContent" : "innerText";
		if (void 0 === e) return t[o];
		t.innerHTML = "", t.appendChild(document.createTextNode(e))
	}

	function renderTemplate(t, e, o) {
		var n, i = document.createElement("div");
		i.innerHTML = t;
		for (var s in e) e.hasOwnProperty(s) && (n = i.getElementsByClassName ? i.getElementsByClassName("kf5-tpl-" + s) :
			getElementsByClassName(i, "kf5-tpl-" + s), (n = n.length ? n[0] : null) && (o && "function" == typeof o[s] ? o[s](n,
				e[s]) : elementText(n, e[s])));
		return i
	}

	function KF5SupportBox(t) {
		this.config = t || {}, this.config.is_overdue || (this.config.version = this.config.version || 2, 2 === this.config.version &&
			(this.config.facade = {
				0: 2,
				1: 3,
				2: 1,
				3: 4
			} [this.config.facade]), this.events = {}, this.init())
	}

	function bindEvent(t, e, o) {
		if (t.addEventListener) return t.addEventListener(e, o, !1);
		if (t.attachEvent) return "on" !== e.slice(0, 2) && "page:load" !== e && "message" !== e && (e = "on" + e), t.attachEvent(
			e, o, !1);
		throw new Error("Error with binding Event!")
	}

	function embed(t, e) {
		var o, n, i, s = window.document.createElement("iframe");
		s.src = "javascript:false", s.title = "", s.role = "presentation", (s.frameElement || s).style.cssText =
			"display: none", window.document.body.appendChild(s), i = s.contentWindow;
		try {
			n = i.document
		} catch (t) {
			o = window.document.domain, s.src = 'javascript:var doc=document.open();doc.domain="' + o + '";void(0);', n = i.document
		}
		n.open().start = function() {
			e && ("object" == typeof e ? e.iframeWindow = i : "function" == typeof e && e(i))
		}, n.write('<body onload="document.start();">'), n.write('<script src="' + t + '""><\/script>'), n.close()
	}

	function getStyle(t, e) {
		var o, n, i = /[+-]?(?:\d*\.|)\d+(?:[eE][+-]?\d+|)/.source,
			s = /^margin/,
			a = /^(top|right|bottom|left)$/,
			r = new RegExp("^(" + i + ")(?!px)[a-z%]+$", "i");
		return window.getComputedStyle ? (o = function(t) {
			return t.ownerDocument.defaultView.getComputedStyle(t, null)
		}, n = function(t, e, n) {
			var i, a, p, c, l = t.style;
			return n = n || o(t), c = n ? n.getPropertyValue(e) || n[e] : void 0, n && r.test(c) && s.test(e) && (i = l.width,
				a = l.minWidth, p = l.maxWidth, l.minWidth = l.maxWidth = l.width = c, c = n.width, l.width = i, l.minWidth = a,
				l.maxWidth = p), void 0 === c ? c : c + ""
		}) : document.documentElement.currentStyle && (o = function(t) {
			return t.currentStyle
		}, n = function(t, e, n) {
			var i, s, p, c, l = t.style;
			return n = n || o(t), c = n ? n[e] : void 0, null == c && l && l[e] && (c = l[e]), r.test(c) && !a.test(e) && (i =
				l.left, s = t.runtimeStyle, p = s && s.left, p && (s.left = t.currentStyle.left), l.left = "fontSize" === e ?
				"1em" : c, c = l.pixelLeft + "px", l.left = i, p && (s.left = p)), void 0 === c ? c : c + "" || "auto"
		}), n && n(t, e)
	}

	function animate(t, e, o) {
		function n() {
			if (clearInterval(c), c = null, !o.carryOn) {
				for (var n in e) t.style[n] = e[n] + "px";
				"function" == typeof o.callback && o.callback.call(t)
			}
			t._finishAnimation = null
		}
		var i = {};
		for (var s in e) i[s] = parseInt(getStyle(t, s));
		var a = o.duration || 500,
			r = Date.now(),
			p = 0,
			c = setInterval(function() {
				p = (Date.now() - r) / a, p = p > 1 ? 1 : p;
				var s = easing[o.easing || "swing"](p);
				for (var c in e) t.style[c] = i[c] + (e[c] - i[c]) * s + "px";
				p >= 1 && n()
			}, 1e3 / 60);
		t._finishAnimation = n
	}

	function slideUp(t, e) {
		t._finishAnimation && t._finishAnimation(), e = e || {};
		var o, n = e.by || "height";
		t.style.display = "block", o = parseInt(getStyle(t, n)), t.style[n] = (e.from || 0) + "px";
		var i = {};
		i[n] = o, animate(t, i, e)
	}

	function slideDown(t, e) {
		t._finishAnimation && t._finishAnimation(), e = e || {};
		var o = e.by || "height",
			n = getStyle(t, o),
			i = e.callback;
		e.callback = "function" == typeof i ? function() {
			this.style.display = "none", this.style[o] = n, i.call(this)
		} : function() {
			this.style.display = "none", this.style[o] = n
		};
		var s = {};
		s[o] = e.to || 0, animate(t, s, e)
	}

	function hideElement(t) {
		t.style.display = "none"
	}

	function showElement(t) {
		t.style.display = "block"
	}

	function cookie(t, e, o) {
		if (void 0 === e) {
			var n = null;
			if (document.cookie && "" != document.cookie)
				for (var i = document.cookie.split(";"), s = 0; s < i.length; s++) {
					var a = i[s].replace(/^\s+|\s+$/g, "");
					if (a.substring(0, t.length + 1) == t + "=") {
						n = decodeURIComponent(a.substring(t.length + 1));
						break
					}
				}
			return n
		}
		o = o || {}, null === e && (e = "", o.expires = -1);
		var r = "";
		if (o.expires && ("number" == typeof o.expires || o.expires.toUTCString)) {
			var p;
			"number" == typeof o.expires ? (p = new Date, p.setTime(p.getTime() + 24 * o.expires * 60 * 60 * 1e3)) : p = o.expires,
				r = "; expires=" + p.toUTCString()
		}
		var c = o.path ? "; path=" + o.path : "",
			l = o.domain ? "; domain=" + o.domain : "",
			u = o.secure ? "; secure" : "";
		document.cookie = [t, "=", encodeURIComponent(e), r, c, l, u].join("")
	}

	function autoPopupService() {
		KF5SupportBox.ready(function() {
			function t() {
				var t = renderTemplate(e.getOpt(e.getOpt("is_mobile") ? "mobilePopupTemplate" : "popupTemplate"), {
						title: o.title,
						text: {
							content: o.text,
							color: o.textColor
						},
						btn: {
							color: o.buttonColor
						},
						window: {
							color: o.windowColor
						},
						avatar: o.avatar
					}, {
						text: function(t, e) {
							e.color && (t.style.color = e.color), e.content && elementText(t, e.content)
						},
						btn: function(t, e) {
							e.color && (t.style.background = e.color)
						},
						window: function(t, e) {
							e.color && (t.style.background = e.color)
						},
						avatar: function(t, e) {
							t.src = e
						}
					}),
					n = 0;
				e.el.appendChild(t);
				var i = document.getElementById("kf5-sbox-popup-close");
				bindEvent(document.getElementById("kf5-sbox-popup-btn"), "click", function() {
					t.style.display = "none", KF5SupportBoxAPI.open(function() {
						KF5SupportBoxAPI.hideButton()
					})
				}), bindEvent(i, "click", function() {
					t.style.display = "none", ++n < o.rejectLimit && o.rejectDelay && setTimeout(function() {
						e.isOpened || (t.style.display = "block")
					}, 1e3 * o.rejectDelay)
				})
			}
			var e = KF5SupportBox.instance;
			if (e.getOpt("pop_status") && !e.isAutoOpen()) {
				var o = {
					title: e.getOpt("pop_title") || "在线客服",
					text: e.getOpt("pop_welcome") || "您好,有什么可以帮助您的吗?",
					textColor: e.getOpt("pop_text_color"),
					buttonColor: e.getOpt("pop_button_color"),
					windowColor: e.getOpt("pop_window_color"),
					avatar: e.getOpt("pop_service_picture_url"),
					delay: e.getOpt("pop_after_second"),
					rejectDelay: e.getOpt("pop_interval"),
					rejectLimit: e.getOpt("pop_refuse_count")
				};
				setTimeout(function() {
					e.ready(function() {
						e.isOpened || t()
					})
				}, 1e3 * o.delay)
			}
		})
	}

	function autoAcceptService(t, e, o) {
		setTimeout(function() {
			t.noticeElement && o()
		}, 1e3 * e)
	}

	function autoInitService() {
		window.initializeKF5SupportBox || (window.initializeKF5SupportBox = KF5SupportBox.loadConfig), bindEvent(window,
			"DOMContentLoaded", KF5SupportBox.loadConfig), bindEvent(window, "load", KF5SupportBox.loadConfig), bindEvent(
			window.document, "page:load", KF5SupportBox.loadConfig), bindEvent(window.document, "onreadystatechange", function() {
			"complete" === window.document.readyState && KF5SupportBox.loadConfig()
		})
	}

	function setup() {
		bindEvent(window, "message", function(t) {
			var e, o, n;
			if (t.origin.match(/^https?:\/\/(.*)$/)[1] === kf5Domain)
				if (t.data && "string" == typeof t.data && (e = t.data.match(/^([^ ]+)(?: +(.*))?/), o = e[1], n = e[2]),
					"CMD::showSupportbox" === o) KF5SupportBox.instance && (KF5SupportBox.instance.open(), KF5SupportBox.instance.hideButton());
				else if ("CMD::hideSupportbox" === o) KF5SupportBox.instance && KF5SupportBox.instance.close(function() {
				KF5SupportBox.instance.showButton()
			});
			else if ("CMD::resizeIframe" === o);
			else if ("CMD::kf5Notice" === o) KF5SupportBox.instance && KF5SupportBox.instance.showNotice(n && JSON.parse(n));
			else if ("CMD::newMsgCountNotice" === o) {
				if (KF5SupportBox.instance) {
					var i = KF5SupportBox.instance.getElement("#msg-number"),
						s = parseInt(n);
					s ? (i.style.display = "block", i.innerHTML = s < 10 ? s : "...") : (i.style.display = "none", i.innerHTML = "")
				}
			} else "CMD::iframeReady" === o && KF5SupportBox.instance.onIframeReady()
		})
	}
	if (window.KF5SupportBoxAPI) return void console.error("KF5SupportBoxAPI already loaded");
	var privateData = {},
		script = window.document.getElementById("kf5-provide-supportBox"),
		parts = script.src.split("//"),
		assetsHost = parts.length > 1 ? parts[1].split("/")[0] : "assets.kf5.com",
		kf5Domain = script.getAttribute("kf5-domain"),
		protocol = ".kf5.com" === kf5Domain.slice(-".kf5.com".length) ? "https:" : "",
		lang = script.getAttribute("lang"),
		disableAutoInit = script.getAttribute("no-auto-init"),
		kchatID = script.getAttribute("kchat-id") || "",
		supportboxConfigURL = protocol + "//" + kf5Domain + "/supportbox/buttonconfig?supportbox_id=" + kchatID,
		date = (new Date).getDay(),
		_config = {
			btn_name: "在线咨询",
			facade: 4,
			icon: 0,
			color: "#5d94f3",
			position: "left",
			vertical: !1,
			iframeURL: protocol + "//" + kf5Domain + "/kchat" + (kchatID ? "/" + kchatID : "") +
				"?supportbox=1&active_in_iframe=0",
			styleURL: "https://" + assetsHost + "/supportbox/css/supportBtn.css",
			template: '<div id="kf5-support-block" class="kf5-supportBox" style="display: none"><a id="kf5-close-btn" class="kf5-support-chat_close kf5-waves" href="javascript:;"></a><div id="kf5-loading" class="kf5-loading kf5-loading-md kf5-center"></div><div id="kf5-iframe-holder"></div></div><div id="kf5-support-btn" style="{{text_color}}; {{bg_color}};" class="kf5-chatSupport-btn kf5-chatSupport-style{{facade}} kf5-chatSupport-icon{{icon}} kf5-waves waves-effect waves-light"><span>{{title}}</span><div id="msg-number" class="kf5-chatSupport_msgNumber" style="display: none"></div></div><div id="kf5-backdrop" class="kf5-backdrop" style="display: none;"><a class="kf5-backdrop-close">关闭</a><a href="" target="_blink"><img id="kf5-view-image" class="kf5-backdrop-img" src=""></a></div>',
			noticeTemplate: '<div class="kf5-support-message" style="right:30px;bottom: 30px"> <div class="kf5-support-message-left"> <img class="kf5-tpl-noticeAvatar" src="" alt=""> </div> <div class="kf5-support-message-content"> <div class="kf5-support-message-name kf5-tpl-noticeTitle"></div> <div class="kf5-support-message-info kf5-tpl-noticeContent"></div> </div> <div class="kf5-support-message-right"> <a id="kf5-support-message-accept" class="kf5-support-message-accept kf5-tpl-noticeAccept">接受</a> <a id="kf5-support-message-reject" class="kf5-support-message-reject kf5-tpl-noticeReject">拒绝</a> </div> </div>',
			popupTemplate: '<div class="kf5-sbox-popup-pc-wrap"><div class="kf5-sbox-popup-content"><a id="kf5-sbox-popup-close" class="kf5-sbox-popup-close"></a><div class="kf5-sbox-popup-main"><div class="kf5-sbox-popup-img"><img class="kf5-tpl-avatar" src="" alt="" /></div><h1 class="kf5-sbox-popup-title kf5-tpl-title">在线客服</h1><p class="kf5-sbox-popup-text kf5-tpl-text"></p></div><div class="kf5-sbox-popup-footer"><a id="kf5-sbox-popup-btn" class="kf5-sbox-popup-btn kf5-tpl-btn">立即咨询</a></div></div></div>',
			mobilePopupTemplate: '<div class="kf5-sbox-popup-mobile-wrap"><div class="kf5-sbox-popup-content"><h1 class="kf5-sbox-popup-title kf5-tpl-title"></h1><div class="kf5-sbox-popup-main"><div class="kf5-sbox-popup-text kf5-tpl-text"></div></div><div class="kf5-sbox-popup-footer"><a id="kf5-sbox-popup-close" class="kf5-sbox-popup-close">取消</a><a id="kf5-sbox-popup-btn" class="kf5-sbox-popup-btn">立即咨询</a></div></div></div>',
			defaultNoticeAvatar: "https://" + assetsHost + "/supportbox/img/kf5-icon-talk.png",
			autoLoadIframe: !0,
			mobileOpenIframe: !1,
			autoOpen: !1,
			pop_status: 0
		},
		_old_config = {
			has_aside: !1,
			btn_icon: "https://" + assetsHost + "/supportbox/img/icon2.png",
			styleURL: "https://" + assetsHost + "/supportbox/css/btn.css",
			template: '<div id="kf5-support-btn" class="kf5-support-btn" style="{{bg_color}}"> <img src="{{btn_icon}}" alt=""><span>{{title}}</span> </div> <div id="kf5-support-block" class="kf5-support kf5-support-show {{blockClassNames}}" style="display: none;"> <a id="kf5-close-btn" class="kf5-close" title="最小化"><i class="kf5-icon-clear"></i></a> <div id="kf5-loading" class="kf5-loading"> </div> <div id="kf5-iframe-holder" style="display:none;"></div> </div>'
		};
	Date.now = Date.now || function() {
		return (new Date).getTime()
	};
	var noticeTemplateHolders = {
			noticeAvatar: function(t, e) {
				t.src = e
			}
		},
		JSON = window.JSON || {
			stringify: function(t) {
				var e, o = "";
				if (null === t) return String(t);
				switch (typeof t) {
					case "number":
					case "boolean":
						return String(t);
					case "string":
						return '"' + t + '"';
					case "undefined":
					case "function":
						return
				}
				switch (Object.prototype.toString.call(t)) {
					case "[object Array]":
						o += "[";
						for (var n = 0, i = t.length; n < i; n++) e = JSON.stringify(t[n]), o += (void 0 === e ? null : e) + ",";
						return "[" !== o && (o = o.slice(0, -1)), o += "]";
					case "[object Date]":
						return '"' + (t.toJSON ? t.toJSON() : t.toString()) + '"';
					case "[object RegExp]":
						return "{}";
					case "[object Object]":
						o += "{";
						for (n in t) t.hasOwnProperty(n) && void 0 !== (e = JSON.stringify(t[n])) && (o += '"' + n + '":' + e + ",");
						return "{" !== o && (o = o.slice(0, -1)), o += "}";
					case "[object String]":
						return '"' + t.toString() + '"';
					case "[object Number]":
					case "[object Boolean]":
						return t.toString()
				}
			},
			parse: function(jsonStr) {
				return eval("(" + jsonStr + ")")
			}
		};
	KF5SupportBox.prototype = {
		el: null,
		url: function() {
			var t = this.getOpt("iframeURL"),
				e = [];
			return this.AgentGroupData && (this.AgentGroupData.agent_ids && e.push("agent_ids=" + this.AgentGroupData.agent_ids),
					this.AgentGroupData.force && e.push("force=" + this.AgentGroupData.force)), this.CategoryType && this.CategoryType
				.category_ids && e.push("category_ids=" + this.CategoryType.category_ids), this.AIQuestionBankType && this.AIQuestionBankType
				.forum_ids && e.push("forum_ids=" + this.AIQuestionBankType.forum_ids), this.questionAgent && e.push(
					"questionAgent=" + this.questionAgent), t + "&" + e.join("&")
		},
		on: function(t, e) {
			return void 0 === this.events[t] && (this.events[t] = []), "function" == typeof e && this.events[t].push(e), this
		},
		emit: function(t) {
			for (var e = this.events[t] || [], o = Array.prototype.slice.call(arguments, 1), n = e.length, i = 0; i < n; i++) e[
				i].apply(null, o)
		},
		getElement: function(t) {
			return window.document.getElementById(t.replace("#", ""))
		},
		getOpt: function(t) {
			var e = this.config || {};
			return void 0 !== e[t] ? e[t] : 1 === e.version && void 0 !== _old_config[t] ? _old_config[t] : _config[t]
		},
		setOpt: function(t, e) {
			this.config[t] = e
		},
		init: function() {
			return this.initElements(), this
		},
		initElements: function() {
			1 === this.getOpt("version") ? this._prepareOldElement() : this._prepareElement(), this.render()
		},
		render: function() {
			var t = this;
			this._prepareStyle(), t.link.onload = function() {
				document.body.appendChild(t.el), t.onDidInsertElement(), t._bindEvents(), t.link.onload = null
			}, document.body.appendChild(t.link)
		},
		onDidInsertElement: function() {
			if (this.waitingQueue)
				for (; this.waitingQueue.length;) this.waitingQueue.shift()(this)
		},
		waitingQueue: null,
		ready: function(t) {
			this.el && this.el.parentNode ? t(this) : (this.waitingQueue || (this.waitingQueue = []), this.waitingQueue.push(t))
		},
		_prepareStyle: function() {
			var t = this.link = window.document.createElement("link");
			return t.rel = "styleSheet", t.type = "text/css", t.href = this.getOpt("styleURL") + "?v=" + date, this
		},
		_prepareElement: function() {
			var t = "kf5-support-chat";
			"left" === this.getOpt("position") ? t += " kf5-chatSupport-left-bottom" : "right" === this.getOpt("position") ? t +=
				" kf5-chatSupport-right-bottom" : t += " " + this.getOpt("position");
			var e = this.getOpt("facade") || 4;
			return this.getOpt("is_mobile") && (t += " kf5-mobile"), this.el = window.document.createElement("div"), this.el.setAttribute(
				"class", t), this.el.setAttribute("style", "position: relative;z-index: 2147483000"), this.el.innerHTML = this.getOpt(
				"template").replace("{{title}}", this.getOpt("btn_name")).replace("{{facade}}", e).replace("{{icon}}", this.getOpt(
				"icon")).replace("{{text_color}}", this.getOpt("text_color") ? "color:" + this.getOpt("text_color") : "").replace(
				"{{bg_color}}", this.getOpt("color") ? "background:" + this.getOpt("color") : ""), this
		},
		_prepareOldElement: function() {
			var t = "kf5-support-123456789";
			return "left" === this.getOpt("position") ? t += " kf5-left" : "right" === this.getOpt("position") ? t +=
				" kf5-right" : t += " " + this.getOpt("position"), isNaN(+this.getOpt("facade")) ? t += " " + this.getOpt(
					"facade") : t += " kf5-style" + (parseInt(this.getOpt("facade")) || 1), this.getOpt("is_mobile") && (t +=
					" kf5-mobile"), this.el = window.document.createElement("div"), this.el.setAttribute("class", t), this.el.setAttribute(
					"id", "kf5-support-123456789"), this.el.innerHTML = this.getOpt("template").replace("{{title}}", this.getOpt(
					"btn_name") || "获取帮助").replace("{{btn_icon}}", this.getOpt("btn_icon") + "?v=" + date).replace("{{bg_color}}",
					this.getOpt("color") ? "background:" + this.getOpt("color") : "").replace("{{blockClassNames}}", this.getOpt(
					"has_aside") ? "kf5-has-aside" : ""), this
		},
		addEventCreater: function() {
			var t = function(t, e) {
				for (var o = t.split(/\s+/g), n = 0; n < o.length; n++) {
					var i = o[n];
					e.call(this, i)
				}
			};
			return "function" == typeof window.addEventListener ? function(e, o, n) {
				t(o, function(t) {
					e.addEventListener(t, n, !1)
				})
			} : "function" == typeof window.attachEvent ? function(e, o, n) {
				t(o, function(t) {
					e.attachEvent("on" + t, n)
				})
			} : function(e, o, n) {
				t(o, function(t) {
					e["on" + t] = n
				})
			}
		},
		_bindEvents: function() {
			var t = this,
				e = this.addEventCreater();
			if (!this.el.eventBinded) {
				var o = this.getElement("#kf5-support-btn"),
					n = this.getElement("#kf5-close-btn"),
					i = this.getElement("#kf5-backdrop");
				e(o, "click touchstart", function() {
					t.open(), t.hideButton()
				}), e(n, "click touchstart", function() {
					t.close(function() {
						t.showButton()
					})
				}), i && e(i, "click touchstart", function() {
					i.style.display = "none"
				}), this.el.eventBinded = !0
			}
			return this.ready(function() {
				t.getOpt("autoLoadIframe") ? t.loadIframe() : cookie("kf5-supportBox-autoOpen", null, {
					path: "/"
				}), t.isAutoOpen() && (t.open(), t.hideButton())
			}), this
		},
		isAutoOpen: function() {
			return !this.getOpt("is_mobile") && (this.getOpt("autoOpen") || cookie("kf5-supportBox-autoOpen"))
		},
		onIframeReady: function() {
			var t = this;
			this.getElement("#kf5-loading").style.display = "none";
			var e = this.iframe;
			this.emit("iframeReady", e), this.identifyData && this.identify(this.identifyData), t.iframe && t.iframe.contentWindow &&
				t.iframe.contentWindow.postMessage && (t.iframe.contentWindow.postMessage("CMD::referrerInfo " + JSON.stringify({
					title: document.title,
					url: location.href,
					referrer: document.referrer
				}), "*"), t.postMessage("CMD::toggleIframePanel", {
					opened: t.isOpened
				})), this.iframeIsReady = !0
		},
		loadIframe: function() {
			var t = this.getElement("#kf5-widget-iframe"),
				e = this.getElement("kf5-iframe-holder");
			return t || (this.iframe = t = document.createElement("iframe"), t.setAttribute("id", "kf5-widget-iframe"), t.setAttribute(
					"class", "kf5-supportBox_iframe"), t.setAttribute("frameborder", "0"), t.setAttribute("scrolling", "no")), t.getAttribute(
					"src") || t.setAttribute("src", this.url()), e && (e.parentNode.insertBefore(t, e), e.parentNode.removeChild(e)),
				this
		},
		reloadIframe: function() {
			return this.iframe.setAttribute("src", this.url()), this
		},
		removeButton: function() {
			return hideElement(this.getElement("#kf5-support-btn")), this.buttonRemoved = !0, this
		},
		showButton: function(t) {
			if (!this.buttonRemoved) {
				var e = {
					duration: 300,
					easing: "swing",
					callback: t,
					from: -80
				};
				this.getOpt("vertical") ? /left/.test(this.getOpt("position")) ? e.by = "left" : e.by = "right" : e.by = "bottom",
					slideUp(this.getElement("#kf5-support-btn"), e)
			}
		},
		hideButton: function(t) {
			if (!this.buttonRemoved && !this.getOpt("is_mobile")) {
				var e = {
					duration: 300,
					easing: "swing",
					callback: t,
					to: -80
				};
				this.getOpt("vertical") ? /left/.test(this.getOpt("position")) ? e.by = "left" : e.by = "right" : e.by = "bottom",
					slideDown(this.getElement("#kf5-support-btn"), e)
			}
		},
		shouldOpenNewPage: function() {
			return this.getOpt("is_mobile") && !this.getOpt("mobileOpenIframe")
		},
		open: function(t) {
			if (this.shouldOpenNewPage()) return void this.openNewPage();
			this.isOpened || (this.loadIframe(), slideUp(this.getElement("#kf5-support-block"), {
				duration: 300,
				easing: "swing",
				callback: t,
				by: "bottom",
				from: -450
			}), this.getOpt("is_mobile") || cookie("kf5-supportBox-autoOpen", 1, {
				expires: .125,
				path: "/"
			}), this.isOpened = !0, this.postMessage("CMD::toggleIframePanel", {
				opened: !0
			}))
		},
		postMessage: function(t, e) {
			this.iframe && this.iframe.contentWindow && this.iframe.contentWindow.postMessage && this.iframe.contentWindow.postMessage(
				t + " " + JSON.stringify(e), "*")
		},
		openNewPage: function() {
			var t, e, o = this.getOpt("iframeURL"),
				n = {
					identifyData: this.identifyData,
					AgentGroupData: this.AgentGroupData,
					AIQuestionBankType: this.AIQuestionBankType,
					CategoryType: this.CategoryType
				},
				i = ["lang=" + (this.getOpt("lang") || "")];
			for (var s in n) {
				var a = n[s];
				if (a && "object" == typeof a)
					for (t in a) e = a[t], "object" == typeof e && (e = e instanceof Array && "metadata" !== t ? e.join(",") : JSON.stringify(
						e)), i.push(t + "=" + e)
			}
			window.location.href = o + "&" + i.join("&")
		},
		close: function(t) {
			slideDown(this.getElement("#kf5-support-block"), {
				duration: 300,
				easing: "swing",
				callback: t,
				by: "bottom",
				to: -450
			}), cookie("kf5-supportBox-autoOpen", null, {
				path: "/"
			}), this.isOpened = !1, this.postMessage("CMD::toggleIframePanel", {
				opened: !1
			})
		},
		hide: function() {
			hideElement(this.el)
		},
		show: function() {
			showElement(this.el)
		},
		identify: function(t) {
			if (t) {
				var e = JSON.stringify(t);
				this.iframe && this.iframe.contentWindow && this.iframe.contentWindow.postMessage && this.iframe.contentWindow.postMessage(
					"CMD::identify " + e, "*"), this.identifyData = t
			}
		},
		setAgents: function(t) {
			t && (this.AgentGroupData = t)
		},
		setKnowledgeStore: function(t) {
			t && (this.CategoryType = t)
		},
		setAIStore: function(t) {
			t && (this.AIQuestionBankType = t)
		},
		appendMessageCard: function(t) {
			var e = this;
			this.referrerLink = t;
			var o = function() {
				e.postMessage("CMD::appendMessageCard", {
					url: t.url || "",
					title: t.title || "",
					description: t.description || "",
					thumbnail: t.thumbnail
				})
			};
			this.iframeIsReady ? o() : this.on("iframeReady", o)
		},
		showNotice: function(t) {
			function e() {
				n.open(), n.hideButton(), n.iframe && n.iframe.contentWindow && n.iframe.contentWindow.postMessage(
					"CMD::kf5NoticeAccepted " + JSON.stringify(t.data), "*"), n.closeNotice()
			}
			var o, n = this;
			return t = "object" == typeof t ? t : {}, o = renderTemplate(this.getOpt("noticeTemplate"), {
					noticeTitle: t.title || "提示信息",
					noticeContent: t.content || "",
					noticeAvatar: t.avatar || this.getOpt("defaultNoticeAvatar"),
					noticeAccept: t.submitText || "接受",
					noticeReject: t.cancelText || "拒绝"
				}, noticeTemplateHolders), this.closeNotice(), this.noticeElement = o, 1 === this.getOpt("version") ? document.body
				.appendChild(o) : this.el && this.el.appendChild(o), bindEvent(document.getElementById(
					"kf5-support-message-accept"), "click", e), bindEvent(document.getElementById("kf5-support-message-reject"),
					"click",
					function() {
						n.iframe && n.iframe.contentWindow && n.iframe.contentWindow.postMessage("CMD::kf5NoticeRejected " + JSON.stringify(
							t.data), "*"), n.closeNotice()
					}), this.getOpt("pop_access_invite") && autoAcceptService(this, this.getOpt("pop_access_invite"), e), o
		},
		closeNotice: function() {
			this.noticeElement && (this.noticeElement.parentNode.removeChild(this.noticeElement), this.noticeElement = null)
		},
		setQuestion: function(t) {
			this.questionAgent = t
		}
	}, KF5SupportBox.waitingQueue = [], KF5SupportBox.onConfigReady = function() {
		if (!KF5SupportBox.instance)
			for (KF5SupportBox.init(); KF5SupportBox.waitingQueue.length;) KF5SupportBox.waitingQueue.shift()()
	}, KF5SupportBox.ready = function(t) {
		KF5SupportBox.instance ? t() : KF5SupportBox.waitingQueue.push(t)
	}, KF5SupportBox.init = function() {
		if (!KF5SupportBox.instance) return KF5SupportBox.instance = new KF5SupportBox(privateData.KF5_SUPPORTBOX_BUTTON),
			KF5SupportBox.instance
	}, KF5SupportBox.destroy = function() {
		KF5SupportBox.instance.el.parent.removeChild(KF5SupportBox.instance.el), KF5SupportBox.instance = null
	}, KF5SupportBox.loadConfig = function() {
		KF5SupportBox.instance || embed(supportboxConfigURL, function(t) {
			t.KF5_SUPPORTBOX_BUTTON && t.KF5_SUPPORTBOX_BUTTON.show && (privateData.KF5_SUPPORTBOX_BUTTON = t.KF5_SUPPORTBOX_BUTTON,
				KF5SupportBox.onConfigReady())
		})
	};
	var easing = {
		swing: function(t) {
			return .5 - Math.cos(t * Math.PI) / 2
		},
		linear: function(t) {
			return t
		}
	};
	setup(), autoPopupService(), disableAutoInit || autoInitService(), window.KF5SupportBoxAPI = {
		init: KF5SupportBox.loadConfig,
		ready: KF5SupportBox.ready,
		config: function(t) {
			var e = {
				mobileOpenIframe: !0
			};
			if (KF5SupportBox.instance)
				for (var o in t) e[o] && KF5SupportBox.instance.setOpt(o, t[o])
		},
		changeUser: function(t) {
			localStorage.setItem("newKf5User", t), location.reload()
		},
		removeButton: function() {
			KF5SupportBox.instance && KF5SupportBox.instance.ready(function() {
				KF5SupportBox.instance.removeButton()
			})
		},
		showButton: function(t) {
			KF5SupportBox.instance && KF5SupportBox.instance.ready(function() {
				KF5SupportBox.instance.showButton()
			})
		},
		hideButton: function(t) {
			KF5SupportBox.instance && KF5SupportBox.instance.ready(function() {
				KF5SupportBox.instance.hideButton()
			})
		},
		refresh: function() {
			KF5SupportBox.instance && KF5SupportBox.instance.render()
		},
		open: function(t) {
			KF5SupportBox.instance && KF5SupportBox.instance.ready(function() {
				KF5SupportBox.instance.open(t)
			})
		},
		close: function(t) {
			KF5SupportBox.instance && KF5SupportBox.instance.ready(function() {
				KF5SupportBox.instance.close(t)
			})
		},
		identify: function(t) {
			KF5SupportBox.instance && t && KF5SupportBox.instance.identify(t)
		},
		setQuestion: function(t) {
			KF5SupportBox.instance && t && KF5SupportBox.instance.setQuestion(t)
		},
		registerLang: function(t, e) {
			var o = KF5SupportBox.instance;
			if (o) {
				var n = function() {
					o.postMessage("CMD::registerLang", {
						name: t,
						map: e
					})
				};
				if (o.iframe) return n();
				o.on("iframeReady", n)
			}
		},
		useLang: function(t) {
			var e = KF5SupportBox.instance;
			if (e) {
				var o = function() {
					e.postMessage("CMD::useLang", {
						name: t
					})
				};
				e.iframe && o(), e.on("iframeReady", o)
			}
		},
		setParams: function(t) {
			this.setAIStore(t.forum_ids), this.setAgents(t.agent_ids, +!!t.force), this.setKnowledgeStore(t.category_ids)
		},
		setAgents: function(t, e) {
			if ("[object Array]" !== Object.prototype.toString.call(t)) throw TypeError("agent_ids is expected to be an array");
			KF5SupportBox.instance && t.length > 0 && KF5SupportBox.instance.setAgents({
				agent_ids: t,
				force: e
			})
		},
		setKnowledgeStore: function(t) {
			if ("[object Array]" !== Object.prototype.toString.call(t)) throw TypeError(
				"category_ids is expected to be an array");
			KF5SupportBox.instance && t.length > 0 && KF5SupportBox.instance.setKnowledgeStore({
				category_ids: t
			})
		},
		setAIStore: function(t) {
			if ("[object Array]" !== Object.prototype.toString.call(t)) throw TypeError("forum_ids is expected to be an array");
			KF5SupportBox.instance && t.length > 0 && KF5SupportBox.instance.setAIStore({
				forum_ids: t
			})
		},
		appendMessageCard: function(t) {
			KF5SupportBox.instance && KF5SupportBox.instance.ready(function() {
				KF5SupportBox.instance.appendMessageCard(t)
			})
		}
	}
}(window);
