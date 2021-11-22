// @license magnet:?xt=urn:btih:d3d9a9a6595521f9666a5e94cc830dab83b65699&dn=expat.txt Expat/MIT
if (page !== '') {

	if (page === 'status') {
		$(function() {
			$(".server").each(function() {
				let serverID = $(this).data("id");
				let serverBungee = $(this).data("bungee");
				let serverPlayerList = $(this).data("players");
				let serverElem = '#server' + serverID + '[data-id=' + serverID + ']';

				const paramChar = URLBuild('').includes('?') ? '&' : '?';

				$.getJSON(URLBuild('queries/server/' + paramChar + 'id=' + serverID), function(data){
					var content = '';
					var players = '';
					if (data.status_value === 1) {
						$(serverElem).addClass("green");
						content = data.player_count + "/" + data.player_count_max;
						if (serverBungee === 1) {
							players = bungeeInstance;
						} else {
							if (serverPlayerList === 1) {
								if (data.player_list.length > 0) {
                  var promises = [];
                  $.each(data.player_list, function (key, value) {
                    var request = $.get(URLBuild('profile/' + value.name), function() {
                        players += '<a href="' + URLBuild('profile/' + value.name) + '" data-tooltip="' + value.name + '" data-variation="mini" data-inverted="" data-position="bottom center"><img class="ui mini circular image" src="' + avatarSource.replace('{x}', value.id).replace('{y}', 64) + '" alt="' + value.name + '"></a>';
                    }).fail(function() {
                        players += '<a data-tooltip="' + value.name + '" data-variation="mini" data-inverted="" data-position="bottom center"><img class="ui mini circular image" src="' + avatarSource.replace('{x}', value.id).replace('{y}', 64) + '" alt="' + value.name + '"></a>';
                      });
                    promises.push(request);
                  });
                  
                  $.when.apply($, promises).always(function () {
                    if(data.player_list.length < data.player_count) {
                      players += '<span class="ui blue circular label">+' + (data.player_count - data.player_list.length) + '</span>';
                    }
                    $(serverElem).find('#server-players').html(players);
                  });

								} else {
									players += noPlayersOnline;
								}
							}
						}
					} else {
						$(serverElem).addClass("red");
						content = offline;
						players = noPlayersOnline;
					}

					$(serverElem).find('#server-status').html(content);
					$(serverElem).find('#server-players').html(players);
				});
			});
		});
	} else if (page === 'profile') {
		function showBannerSelect(){
			$('#imageModal').modal({
				onVisible: function() {
					$("select").imagepicker();
				}
			}).modal('show');
		}
		$(function () {
			var postElem = window.location.hash;
			postElem = $(postElem.slice(0, -1));
			if (postElem) {
				setTimeout(function () {
					$('html, body').animate({ scrollTop: postElem.offset().top - 15 }, 800);
				}, 100);
				postElem.delay(600).effect('highlight', {}, 800);
			}
		});
	} else if (page === 'cc_messaging') {
		$('.ui.search').dropdown({
			minCharacters: 3
		});
	}

	else if (route.indexOf("/forum/topic/") != -1) {
		$(function() {
			var postId = window.location.hash.replace('#post-', '');
			var postElem = '#topic-post[post-id=\'' + postId + '\']';
			setTimeout(function(){
			   $('html, body').animate({scrollTop: $(postElem).offset().top-15}, 800);
			}, 100);
			$('> .ui.segment', postElem).delay(600).effect("highlight", {}, 800);
		});
	}
}
// @license-end
