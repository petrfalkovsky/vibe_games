'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"version.json": "96b84768c0f2bee1c5a9be6d37baaa44",
"index.html": "0236bae5ee07483f87f55d11372277f1",
"/": "0236bae5ee07483f87f55d11372277f1",
"main.dart.js": "ec45c53a841188e4c872f4b37aa19dc4",
"flutter.js": "6fef97aeca90b426343ba6c5c9dc5d4a",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "52a5af1c0f0ee3a41144b54aa162282f",
"assets/AssetManifest.json": "c4374c1f1d8effefb15fe91796dc483d",
"assets/NOTICES": "a605c718974158393a614f3b7e460444",
"assets/FontManifest.json": "863a65ee87f5ebd64a2d9f347933c6fe",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"assets/AssetManifest.bin": "01a5d3fc54cd1678832d4a77dbed86db",
"assets/fonts/MaterialIcons-Regular.otf": "4f70bf77d99579bd232f09e72e74636b",
"assets/assets/images/back_status_bar.png": "8ae9fbf8a1079351052a02cfca54e513",
"assets/assets/images/fist.png": "c539d4e75aa1b34d3e891e3aeae83a0d",
"assets/assets/images/app_icon.png": "04024e5cf93b48cdfb672c8f0730e080",
"assets/assets/images/hud_screen_bg.png": "6cef4c9469d1626d73e569d211b9f438",
"assets/assets/images/call_avatar_holder.png": "309f17d887c77422b5cbf77f831e8b6d",
"assets/assets/images/gun.png": "5d5d6b9e670166ca538c6022e573ec3d",
"assets/assets/images/info_forward.png": "bd1aaff6d21d0b4379a0f8e96a162316",
"assets/assets/images/call_avatar.png": "c88aba9c5ab965501d3ab3a42546998b",
"assets/assets/images/info_back.png": "e124590d5bc820103bcc97133ca98e38",
"assets/assets/images/gun_nope.png": "ccfa50589ddd5d28f9df177ae44651aa",
"assets/assets/images/speed_arrow.png": "309d6550b97caee5d34b4fde798cef69",
"assets/assets/images/splash_screen_bg.png": "1b49c41909eaa331e4322dcc38c1d3db",
"assets/assets/images/turn_signal_left.png": "610d2c6e888bccab20300a5b5aa41616",
"assets/assets/images/turn_signal_right.png": "7e1c86d532fbcf550ae9d39f0c6e4282",
"assets/assets/icons/lightning.svg": "6db1e0457c1af9c23c2502d195366ee8",
"assets/assets/icons/point.svg": "f227096f9a7cbdf4590d97522b3d34fb",
"assets/assets/icons/selection_free.svg": "b71800c3ace37ad1fb10df9c3eb5576f",
"assets/assets/icons/list.svg": "8e638a05f46efc3191a88cec6a5ec66f",
"assets/assets/icons/pad.svg": "82fb66feefb160d5a321fa6a4b20781a",
"assets/assets/icons/rub.svg": "e5293a5259355bf4bd2f0d1108d3ebda",
"assets/assets/icons/info_forward.svg": "40a33f3c253ccc165de4ca4cd22088a5",
"assets/assets/icons/tick_square.svg": "f90f47070d6b745e62915620d263e0df",
"assets/assets/icons/noti_close.svg": "f1c5f9bb5a87ed369fb436748f3d6890",
"assets/assets/icons/circle.svg": "b7ddaaf0e4aa347d1d07afbed7eecc51",
"assets/assets/icons/add_icon.svg": "e6d9e312faec906a02c6f8f14d0057d8",
"assets/assets/icons/map.svg": "5bca69160a39a49384758e94c9609c26",
"assets/assets/icons/gas_station.svg": "26821fdd83bcfe6aa1254445c50b2313",
"assets/assets/icons/selection_busy.svg": "60127f8487ae6c04940560defa860124",
"assets/assets/icons/left_part_progress_bar.svg": "aafd6a529183b124d5b29ab8f2ab20db",
"assets/assets/icons/dot.svg": "c96b83b82b05b26ed59424b395bdc75f",
"assets/assets/icons/discount.svg": "7eaec4074eaee36738f2d27fe7ce7bc0",
"assets/assets/icons/remove_icon.svg": "7a23f8f479094c24b74528df4bc33c5a",
"assets/assets/icons/key.svg": "262f5be62c911e7bfbbd2d616e52b14a",
"assets/assets/icons/settings.svg": "aa75d2317ffa3bb0f4e263fbab1c7d86",
"assets/assets/icons/ellipse.svg": "44a023ecdbdc69de72475bccdc2fad97",
"assets/assets/icons/cart.svg": "dcf4bb1542898308a4f64297ca94d98b",
"assets/assets/icons/blue_coin.svg": "ae884ecc845b929ccf8b2142c1a277e3",
"assets/assets/icons/call_answer.svg": "710f673bbdeee06b51c663f57d797638",
"assets/assets/icons/sheeld.svg": "e713877428b230eb7e643d3f5bc6575b",
"assets/assets/icons/close_circle.svg": "761031915795bfba312a28595a3b2e42",
"assets/assets/icons/arrow_up.svg": "21f6f4b398295ad78a02895b1b7fa597",
"assets/assets/icons/attantion_sign.svg": "55cc92ce0c51404e81ed174ee0e19c1e",
"assets/assets/icons/noti_timer.svg": "dbe2a0da576b596b89a7fc6736174549",
"assets/assets/icons/stop.svg": "7852537b0b8064be4ae94449ebb51e7b",
"assets/assets/icons/event.svg": "7cfdae8ffaac65589ccb857372688860",
"assets/assets/icons/noti_case.svg": "882f18b2805fd22f0dea99d74e1b769f",
"assets/assets/icons/chat_ok.svg": "fedb43899e8fdc46c1b8affd0222475a",
"assets/assets/icons/check.svg": "1b345656fb81a709b75cfd466c8d0364",
"assets/assets/icons/noti_click.svg": "bcbf3ab68f565931a5c02567237ad45c",
"assets/assets/icons/mic.svg": "18c400e02206815f32d78350b1fb94b4",
"assets/assets/icons/scan.svg": "c9f6e7a2ba89d3f18dac16ac976d304b",
"assets/assets/icons/call_skip.svg": "395a6ff0d8174d15caab0eedca98510a",
"assets/assets/icons/locate_ninja.svg": "16859b3835931c699d2096cc3e925814",
"assets/assets/icons/crown.svg": "ca5baf2d4ae5fd610de8c4bb1b7ec8ec",
"assets/assets/icons/arrow_down.svg": "803e4ec701dd2563fee073af36a38c0d",
"assets/assets/icons/chat.svg": "b28121f8e0a42acde846e0c2b631aa2e",
"assets/assets/icons/checkbox_circle.svg": "079239629c6c240b7b0c821222c4c10f",
"assets/assets/icons/o_2.svg": "a227df47c503b087095e240ab7b9b7b6",
"assets/assets/icons/sneaker.svg": "f483099527cbba5693efbd8386ad0ec9",
"assets/assets/icons/break_heart_procent.svg": "91528e40261e9b30e00d595911d7f086",
"assets/assets/icons/status_bar_frame.svg": "b1ffc6cb09175b5e17938b60b4a55060",
"assets/assets/icons/mic_off.svg": "0308f765c7c679e9c1237e98f9255edb",
"assets/assets/icons/trash.svg": "d9734771e4b0e3636050f37a3c3fc756",
"assets/assets/icons/turn_signal_right.svg": "fa3bd72643248c1d39dd83df9132290e",
"assets/assets/icons/turn_signal_left.svg": "fc198ccfc4738ec49d51812a5ae94910",
"assets/assets/icons/chat_close.svg": "bc272f7b5dbfa5594d671946b7af1067",
"assets/assets/icons/star.svg": "4afa8168657c287da1ec230a811d1e1b",
"assets/assets/icons/matreshka.svg": "872ac5ec352279da149edf4afb361aea",
"assets/assets/icons/locate.svg": "5f2d79f1e7b4f0b9b97f1e72ae4335fa",
"assets/assets/icons/parashute.svg": "79411624435ea17fa3b636afc7981e2e",
"assets/assets/icons/gift_box.svg": "67718cd8627bb8148d488d918549df69",
"assets/assets/icons/clock.svg": "b7b82bbb6c5776adb355e97def8754b8",
"assets/assets/icons/selection_chosen.svg": "dc63d59bcea1a846992087d91606c131",
"assets/assets/icons/podium.svg": "eb45f46276adbd9ba4e9948a73f062e8",
"assets/assets/icons/radial.svg": "0d72de10a2ea11be5490565fffe39a65",
"assets/assets/icons/car.svg": "bf48b43e6165d8460076300280047af8",
"assets/assets/icons/left_part_of_statusbar_container.svg": "4d177122ba407622df335ac52826c660",
"assets/assets/icons/batary.svg": "61cd8cb5a0248cb3686f26058d30dcfc",
"assets/assets/icons/noti_ring.svg": "23d6239a482025ddaedfc36e7827379c",
"assets/assets/icons/close_square.svg": "bcd46caa20b90cf11d85362efe32588a",
"assets/assets/icons/calendar.svg": "f11d66f5fe729b25b7d0196283851924",
"assets/assets/icons/horizontal_line.svg": "337e24659883f983e084ae4a2c02d3bd",
"assets/assets/icons/cross.svg": "896015e40fd44552a62001451a2b385e",
"assets/assets/icons/gun_nope.svg": "deecd957a63e1fce34eeaaaecc93521f",
"assets/assets/icons/right_part_progress_bar.svg": "0eb1eda81a99d824231a84d25d06f5ca",
"assets/assets/icons/cup.svg": "6b19e88a9e3510525e51485df30ec171",
"assets/assets/icons/arrow_forward.svg": "b2f7a5b1c9d70d997ec7f27e07eb8dec",
"assets/assets/icons/checkbox_active_circle.svg": "bab8501645bd42cfbe8d0a5c3dfe2710",
"assets/assets/icons/lights.svg": "eafd05fe66187fd408e04eb1e74b38a9",
"assets/assets/icons/avatar.svg": "27392a3da572748f39bbdc965fdda646",
"assets/assets/icons/right_part_of_statusbar_container.svg": "87d959f505f08d582b6aa9852fa740a9",
"assets/assets/icons/run.svg": "93f87f9934c3c58f318ddaadaf6a93be",
"assets/assets/icons/info_back.svg": "d25df93f56aff10069eefc3d4f3ff8db",
"assets/assets/icons/heart.svg": "ed5d1afa3f3e80fec71a58cd10752665",
"assets/assets/fonts/TTNorms/TTNorms-Bold.ttf": "64f8b35b6c80f4b77fdc090d3cd9f616",
"assets/assets/fonts/TTNorms/TTNorms-Regular.ttf": "eb6edc3979c854b8a687a8b973dda56a",
"assets/assets/fonts/TTNorms/TTNorms-Medium.ttf": "1082eb3bf7be09cb7eea9fd3c057732e",
"assets/assets/fonts/TTNorms/TTNorms-Black.ttf": "b60f40cea4fa7f81d95785e877c31645",
"assets/assets/fonts/TTNorms/TTNorms-ExtraBold.ttf": "aaeea6a6c907fc502041418b37d5403f",
"assets/assets/fonts/TTNorms/TTNorms-Light.ttf": "1504a2b537f15e92e32f9c9f6970057b",
"assets/assets/translations/ru.json": "16e9e75d4170a5aafc4591ab7a36a0dd",
"assets/assets/translations/en.json": "dadd61fbd7ea1708f2e7dae8c4ff3d28",
"canvaskit/skwasm.js": "95f16c6690f955a45b2317496983dbe9",
"canvaskit/skwasm.wasm": "1a074e8452fe5e0d02b112e22cdcf455",
"canvaskit/chromium/canvaskit.js": "96ae916cd2d1b7320fff853ee22aebb0",
"canvaskit/chromium/canvaskit.wasm": "be0e3b33510f5b7b0cc76cc4d3e50048",
"canvaskit/canvaskit.js": "bbf39143dfd758d8d847453b120c8ebb",
"canvaskit/canvaskit.wasm": "42df12e09ecc0d5a4a34a69d7ee44314",
"canvaskit/skwasm.worker.js": "51253d3321b11ddb8d73fa8aa87d3b15"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
