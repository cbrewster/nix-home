# This file has been generated by node2nix 1.11.1. Do not edit!

{nodeEnv, fetchurl, fetchgit, nix-gitignore, stdenv, lib, globalBuildInputs ? []}:

let
  sources = {
    "@flatten-js/interval-tree-1.0.18" = {
      name = "_at_flatten-js_slash_interval-tree";
      packageName = "@flatten-js/interval-tree";
      version = "1.0.18";
      src = fetchurl {
        url = "https://registry.npmjs.org/@flatten-js/interval-tree/-/interval-tree-1.0.18.tgz";
        sha512 = "o72sZErW0Y1C82Cg7nk82ojJ/22EtmKyp5I3eNqgcOKFp/VCzetATYYjJIqOBBaR7FQ/MFj/ZpsmP38mL4TkYA==";
      };
    };
    "@withgraphite/graphite-cli-routes-0.22.0" = {
      name = "_at_withgraphite_slash_graphite-cli-routes";
      packageName = "@withgraphite/graphite-cli-routes";
      version = "0.22.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/@withgraphite/graphite-cli-routes/-/graphite-cli-routes-0.22.0.tgz";
        sha512 = "0LqJ2UMyGkZgP/cp4x89nKibX8r/XMgC+G4Xhobxq34gSOrihqHQjEvPeTiVgjX4MsH7340v8cE2y5pKX6m0aA==";
      };
    };
    "@withgraphite/retype-0.3.11" = {
      name = "_at_withgraphite_slash_retype";
      packageName = "@withgraphite/retype";
      version = "0.3.11";
      src = fetchurl {
        url = "https://registry.npmjs.org/@withgraphite/retype/-/retype-0.3.11.tgz";
        sha512 = "DIXkXBdZpxB5OQ9p+FFVCJ9/DPHRyBsZg2uyNkltOXJ8jIxI5i6sfa2AZZar0vtXUTyMwK8GjsuN1komzcGMog==";
      };
    };
    "@withgraphite/retyped-routes-0.3.2" = {
      name = "_at_withgraphite_slash_retyped-routes";
      packageName = "@withgraphite/retyped-routes";
      version = "0.3.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/@withgraphite/retyped-routes/-/retyped-routes-0.3.2.tgz";
        sha512 = "EVhradzaO/AMXfCCoGRb2MAO18cg6/f2XSfjGHHvUfdQouAMRDzF8Xq564spaoi53ZB1VlgjqenXi8QGxSfSNQ==";
      };
    };
    "ansi-regex-5.0.1" = {
      name = "ansi-regex";
      packageName = "ansi-regex";
      version = "5.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/ansi-regex/-/ansi-regex-5.0.1.tgz";
        sha512 = "quJQXlTSUGL2LH9SUXo8VwsY4soanhgo6LNSm84E1LBcE8s3O0wpdiRzyR9z/ZZJMlMWv37qOOb9pdJlMUEKFQ==";
      };
    };
    "ansi-styles-4.3.0" = {
      name = "ansi-styles";
      packageName = "ansi-styles";
      version = "4.3.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/ansi-styles/-/ansi-styles-4.3.0.tgz";
        sha512 = "zbB9rCJAT1rbjiVDb2hqKFHNYLxgtk8NURxZ3IZwD3F6NtxbXZQCnnSi1Lkx+IDohdPlFp222wVALIheZJQSEg==";
      };
    };
    "balanced-match-1.0.2" = {
      name = "balanced-match";
      packageName = "balanced-match";
      version = "1.0.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/balanced-match/-/balanced-match-1.0.2.tgz";
        sha512 = "3oSeUO0TMV67hN1AmbXsK4yaqU7tjiHlbxRDZOpH0KW9+CeX4bRAaX0Anxt0tx2MrpRpWwQaPwIlISEJhYU5Pw==";
      };
    };
    "brace-expansion-1.1.11" = {
      name = "brace-expansion";
      packageName = "brace-expansion";
      version = "1.1.11";
      src = fetchurl {
        url = "https://registry.npmjs.org/brace-expansion/-/brace-expansion-1.1.11.tgz";
        sha512 = "iCuPHDFgrHX7H2vEI/5xpz07zSHB00TpugqhmYtVmMO6518mCuRMoOYFldEBl0g187ufozdaHgWKcYFb61qGiA==";
      };
    };
    "brace-expansion-2.0.1" = {
      name = "brace-expansion";
      packageName = "brace-expansion";
      version = "2.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/brace-expansion/-/brace-expansion-2.0.1.tgz";
        sha512 = "XnAIvQ8eM+kC6aULx6wuQiwVsnzsi9d3WxzV3FpWTGA19F621kwdbsAcFKXgKUHZWsy+mY6iL1sHTxWEFCytDA==";
      };
    };
    "chalk-4.1.2" = {
      name = "chalk";
      packageName = "chalk";
      version = "4.1.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/chalk/-/chalk-4.1.2.tgz";
        sha512 = "oKnbhFyRIXpUuez8iBMmyEa4nbj4IOQyuhc/wy9kY7/WVPcwIO9VA668Pu8RkO7+0G76SLROeyw9CpQ061i4mA==";
      };
    };
    "cliui-7.0.4" = {
      name = "cliui";
      packageName = "cliui";
      version = "7.0.4";
      src = fetchurl {
        url = "https://registry.npmjs.org/cliui/-/cliui-7.0.4.tgz";
        sha512 = "OcRE68cOsVMXp1Yvonl/fzkQOyjLSu/8bhPDfQt0e0/Eb283TKP20Fs2MqoPsr9SwA595rRCA+QMzYc9nBP+JQ==";
      };
    };
    "color-convert-2.0.1" = {
      name = "color-convert";
      packageName = "color-convert";
      version = "2.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/color-convert/-/color-convert-2.0.1.tgz";
        sha512 = "RRECPsj7iu/xb5oKYcsFHSppFNnsj/52OVTRKb4zP5onXwVF3zVmmToNcOfGC+CRDpfK/U584fMg38ZHCaElKQ==";
      };
    };
    "color-name-1.1.4" = {
      name = "color-name";
      packageName = "color-name";
      version = "1.1.4";
      src = fetchurl {
        url = "https://registry.npmjs.org/color-name/-/color-name-1.1.4.tgz";
        sha512 = "dOy+3AuW3a2wNbZHIuMZpTcgjGuLU/uBL/ubcZF9OXbDo8ff4O8yVp5Bf0efS8uEoYo5q4Fx7dY9OgQGXgAsQA==";
      };
    };
    "concat-map-0.0.1" = {
      name = "concat-map";
      packageName = "concat-map";
      version = "0.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/concat-map/-/concat-map-0.0.1.tgz";
        sha512 = "/Srv4dswyQNBfohGpz9o6Yb3Gz3SrUDqBH5rTuhGR7ahtlbYKnVxw2bCFMRljaA7EXHaXZ8wsHdodFvbkhKmqg==";
      };
    };
    "define-lazy-prop-2.0.0" = {
      name = "define-lazy-prop";
      packageName = "define-lazy-prop";
      version = "2.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/define-lazy-prop/-/define-lazy-prop-2.0.0.tgz";
        sha512 = "Ds09qNh8yw3khSjiJjiUInaGX9xlqZDY7JVryGxdxV7NPeuqQfplOpQ66yJFZut3jLa5zOwkXw1g9EI2uKh4Og==";
      };
    };
    "emoji-regex-8.0.0" = {
      name = "emoji-regex";
      packageName = "emoji-regex";
      version = "8.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/emoji-regex/-/emoji-regex-8.0.0.tgz";
        sha512 = "MSjYzcWNOA0ewAHpz0MxpYFvwg6yjy1NG3xteoqz644VCo/RPgnr1/GGt+ic3iJTzQ8Eu3TdM14SawnVUmGE6A==";
      };
    };
    "escalade-3.1.1" = {
      name = "escalade";
      packageName = "escalade";
      version = "3.1.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/escalade/-/escalade-3.1.1.tgz";
        sha512 = "k0er2gUkLf8O0zKJiAhmkTnJlTvINGv7ygDNPbeIsX/TJjGJZHuh9B2UxbsaEkmlEo9MfhrSzmhIlhRlI2GXnw==";
      };
    };
    "fs-extra-10.1.0" = {
      name = "fs-extra";
      packageName = "fs-extra";
      version = "10.1.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/fs-extra/-/fs-extra-10.1.0.tgz";
        sha512 = "oRXApq54ETRj4eMiFzGnHWGy+zo5raudjuxN0b8H7s/RU2oW0Wvsx9O0ACRN/kRq9E8Vu/ReskGB5o3ji+FzHQ==";
      };
    };
    "fs.realpath-1.0.0" = {
      name = "fs.realpath";
      packageName = "fs.realpath";
      version = "1.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/fs.realpath/-/fs.realpath-1.0.0.tgz";
        sha512 = "OO0pH2lK6a0hZnAdau5ItzHPI6pUlvI7jMVnxUQRtw4owF2wk8lOSabtGDCTP4Ggrg2MbGnWO9X8K1t4+fGMDw==";
      };
    };
    "get-caller-file-2.0.5" = {
      name = "get-caller-file";
      packageName = "get-caller-file";
      version = "2.0.5";
      src = fetchurl {
        url = "https://registry.npmjs.org/get-caller-file/-/get-caller-file-2.0.5.tgz";
        sha512 = "DyFP3BM/3YHTQOCUL/w0OZHR0lpKeGrxotcHWcqNEdnltqFwXVfhEBQ94eIo34AfQpo0rGki4cyIiftY06h2Fg==";
      };
    };
    "glob-7.2.3" = {
      name = "glob";
      packageName = "glob";
      version = "7.2.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/glob/-/glob-7.2.3.tgz";
        sha512 = "nFR0zLpU2YCaRxwoCJvL6UvCH2JFyFVIvwTLsIf21AuHlMskA1hhTdk+LlYJtOlYt9v6dvszD2BGRqBL+iQK9Q==";
      };
    };
    "glob-8.0.3" = {
      name = "glob";
      packageName = "glob";
      version = "8.0.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/glob/-/glob-8.0.3.tgz";
        sha512 = "ull455NHSHI/Y1FqGaaYFaLGkNMMJbavMrEGFXG/PGrg6y7sutWHUHrz6gy6WEBH6akM1M414dWKCNs+IhKdiQ==";
      };
    };
    "graceful-fs-4.2.10" = {
      name = "graceful-fs";
      packageName = "graceful-fs";
      version = "4.2.10";
      src = fetchurl {
        url = "https://registry.npmjs.org/graceful-fs/-/graceful-fs-4.2.10.tgz";
        sha512 = "9ByhssR2fPVsNZj478qUUbKfmL0+t5BDVyjShtyZZLiK7ZDAArFFfopyOTj0M05wE2tJPisA4iTnnXl2YoPvOA==";
      };
    };
    "has-flag-4.0.0" = {
      name = "has-flag";
      packageName = "has-flag";
      version = "4.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/has-flag/-/has-flag-4.0.0.tgz";
        sha512 = "EykJT/Q1KjTWctppgIAgfSO0tKVuZUjhgMr17kqTumMl6Afv3EISleU7qZUzoXDFTAHTDC4NOoG/ZxU3EvlMPQ==";
      };
    };
    "inflight-1.0.6" = {
      name = "inflight";
      packageName = "inflight";
      version = "1.0.6";
      src = fetchurl {
        url = "https://registry.npmjs.org/inflight/-/inflight-1.0.6.tgz";
        sha512 = "k92I/b08q4wvFscXCLvqfsHCrjrF7yiXsQuIVvVE7N82W3+aqpzuUdBbfhWcy/FZR3/4IgflMgKLOsvPDrGCJA==";
      };
    };
    "inherits-2.0.4" = {
      name = "inherits";
      packageName = "inherits";
      version = "2.0.4";
      src = fetchurl {
        url = "https://registry.npmjs.org/inherits/-/inherits-2.0.4.tgz";
        sha512 = "k/vGaX4/Yla3WzyMCvTQOXYeIHvqOKtnqBduzTHpzpQZzAskKMhZ2K+EnBiSM9zGSoIFeMpXKxa4dYeZIQqewQ==";
      };
    };
    "ini-3.0.0" = {
      name = "ini";
      packageName = "ini";
      version = "3.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/ini/-/ini-3.0.0.tgz";
        sha512 = "TxYQaeNW/N8ymDvwAxPyRbhMBtnEwuvaTYpOQkFx1nSeusgezHniEc/l35Vo4iCq/mMiTJbpD7oYxN98hFlfmw==";
      };
    };
    "is-docker-2.2.1" = {
      name = "is-docker";
      packageName = "is-docker";
      version = "2.2.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/is-docker/-/is-docker-2.2.1.tgz";
        sha512 = "F+i2BKsFrH66iaUFc0woD8sLy8getkwTwtOBjvs56Cx4CgJDeKQeqfz8wAYiSb8JOprWhHH5p77PbmYCvvUuXQ==";
      };
    };
    "is-fullwidth-code-point-3.0.0" = {
      name = "is-fullwidth-code-point";
      packageName = "is-fullwidth-code-point";
      version = "3.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/is-fullwidth-code-point/-/is-fullwidth-code-point-3.0.0.tgz";
        sha512 = "zymm5+u+sCsSWyD9qNaejV3DFvhCKclKdizYaJUuHA83RLjb7nSuGnddCHGv0hk+KY7BMAlsWeK4Ueg6EV6XQg==";
      };
    };
    "is-wsl-2.2.0" = {
      name = "is-wsl";
      packageName = "is-wsl";
      version = "2.2.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/is-wsl/-/is-wsl-2.2.0.tgz";
        sha512 = "fKzAra0rGJUUBwGBgNkHZuToZcn+TtXHpeCgmkMJMMYx1sQDYaCSyjJBSCa2nH1DGm7s3n1oBnohoVTBaN7Lww==";
      };
    };
    "isomorphic-fetch-3.0.0" = {
      name = "isomorphic-fetch";
      packageName = "isomorphic-fetch";
      version = "3.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/isomorphic-fetch/-/isomorphic-fetch-3.0.0.tgz";
        sha512 = "qvUtwJ3j6qwsF3jLxkZ72qCgjMysPzDfeV240JHiGZsANBYd+EEuu35v7dfrJ9Up0Ak07D7GGSkGhCHTqg/5wA==";
      };
    };
    "jsonfile-6.1.0" = {
      name = "jsonfile";
      packageName = "jsonfile";
      version = "6.1.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/jsonfile/-/jsonfile-6.1.0.tgz";
        sha512 = "5dgndWOriYSm5cnYaJNhalLNDKOqFwyDB/rr1E9ZsGciGvKPs8R2xYGCacuf3z6K1YKDz182fd+fY3cn3pMqXQ==";
      };
    };
    "kleur-3.0.3" = {
      name = "kleur";
      packageName = "kleur";
      version = "3.0.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/kleur/-/kleur-3.0.3.tgz";
        sha512 = "eTIzlVOSUR+JxdDFepEYcBMtZ9Qqdef+rnzWdRZuMbOywu5tO2w2N7rqjoANZ5k9vywhL6Br1VRjUIgTQx4E8w==";
      };
    };
    "lodash-4.17.21" = {
      name = "lodash";
      packageName = "lodash";
      version = "4.17.21";
      src = fetchurl {
        url = "https://registry.npmjs.org/lodash/-/lodash-4.17.21.tgz";
        sha512 = "v2kDEe57lecTulaDIuNTPy3Ry4gLGJ6Z1O3vE1krgXZNrsQ+LFTGHVxVjcXPs17LhbZVGedAJv8XZ1tvj5FvSg==";
      };
    };
    "lru-cache-6.0.0" = {
      name = "lru-cache";
      packageName = "lru-cache";
      version = "6.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/lru-cache/-/lru-cache-6.0.0.tgz";
        sha512 = "Jo6dJ04CmSjuznwJSS3pUeWmd/H0ffTlkXXgwZi+eq1UCmqQwCh+eLsYOYCwY991i2Fah4h1BEMCx4qThGbsiA==";
      };
    };
    "minimatch-3.1.2" = {
      name = "minimatch";
      packageName = "minimatch";
      version = "3.1.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/minimatch/-/minimatch-3.1.2.tgz";
        sha512 = "J7p63hRiAjw1NDEww1W7i37+ByIrOWO5XQQAzZ3VOcL0PNybwpfmV/N05zFAzwQ9USyEcX6t3UO+K5aqBQOIHw==";
      };
    };
    "minimatch-5.1.0" = {
      name = "minimatch";
      packageName = "minimatch";
      version = "5.1.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/minimatch/-/minimatch-5.1.0.tgz";
        sha512 = "9TPBGGak4nHfGZsPBohm9AWg6NoT7QTCehS3BIJABslyZbzxfV78QM2Y6+i741OPZIafFAaiiEMh5OyIrJPgtg==";
      };
    };
    "node-fetch-2.6.7" = {
      name = "node-fetch";
      packageName = "node-fetch";
      version = "2.6.7";
      src = fetchurl {
        url = "https://registry.npmjs.org/node-fetch/-/node-fetch-2.6.7.tgz";
        sha512 = "ZjMPFEfVx5j+y2yF35Kzx5sF7kDzxuDj6ziH4FFbOp87zKDZNx8yExJIb05OGF4Nlt9IHFIMBkRl41VdvcNdbQ==";
      };
    };
    "once-1.4.0" = {
      name = "once";
      packageName = "once";
      version = "1.4.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/once/-/once-1.4.0.tgz";
        sha512 = "lNaJgI+2Q5URQBkccEKHTQOPaXdUxnZZElQTZY0MFUAuaEqe1E+Nyvgdz/aIyNi6Z9MzO5dv1H8n58/GELp3+w==";
      };
    };
    "open-8.4.0" = {
      name = "open";
      packageName = "open";
      version = "8.4.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/open/-/open-8.4.0.tgz";
        sha512 = "XgFPPM+B28FtCCgSb9I+s9szOC1vZRSwgWsRUA5ylIxRTgKozqjOCrVOqGsYABPYK5qnfqClxZTFBa8PKt2v6Q==";
      };
    };
    "path-is-absolute-1.0.1" = {
      name = "path-is-absolute";
      packageName = "path-is-absolute";
      version = "1.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/path-is-absolute/-/path-is-absolute-1.0.1.tgz";
        sha512 = "AVbw3UJ2e9bq64vSaS9Am0fje1Pa8pbGqTTsmXfaIiMpnr5DlDhfJOuLj9Sf95ZPVDAUerDfEk88MPmPe7UCQg==";
      };
    };
    "path-to-regexp-6.2.1" = {
      name = "path-to-regexp";
      packageName = "path-to-regexp";
      version = "6.2.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/path-to-regexp/-/path-to-regexp-6.2.1.tgz";
        sha512 = "JLyh7xT1kizaEvcaXOQwOc2/Yhw6KZOvPf1S8401UyLk86CU79LN3vl7ztXGm/pZ+YjoyAJ4rxmHwbkBXJX+yw==";
      };
    };
    "prompts-2.4.2" = {
      name = "prompts";
      packageName = "prompts";
      version = "2.4.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/prompts/-/prompts-2.4.2.tgz";
        sha512 = "NxNv/kLguCA7p3jE8oL2aEBsrJWgAakBpgmgK6lpPWV+WuOmY6r2/zbAVnP+T8bQlA0nzHXSJSJW0Hq7ylaD2Q==";
      };
    };
    "require-directory-2.1.1" = {
      name = "require-directory";
      packageName = "require-directory";
      version = "2.1.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/require-directory/-/require-directory-2.1.1.tgz";
        sha512 = "fGxEI7+wsG9xrvdjsrlmL22OMTTiHRwAMroiEeMgq8gzoLC/PQr7RsRDSTLUg/bZAZtF+TVIkHc6/4RIKrui+Q==";
      };
    };
    "rimraf-3.0.2" = {
      name = "rimraf";
      packageName = "rimraf";
      version = "3.0.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/rimraf/-/rimraf-3.0.2.tgz";
        sha512 = "JZkJMZkAGFFPP2YqXZXPbMlMBgsxzE8ILs4lMIX/2o0L9UBw9O/Y3o6wFw/i9YLapcUJWwqbi3kdxIPdC62TIA==";
      };
    };
    "semver-7.3.7" = {
      name = "semver";
      packageName = "semver";
      version = "7.3.7";
      src = fetchurl {
        url = "https://registry.npmjs.org/semver/-/semver-7.3.7.tgz";
        sha512 = "QlYTucUYOews+WeEujDoEGziz4K6c47V/Bd+LjSSYcA94p+DmINdf7ncaUinThfvZyu13lN9OY1XDxt8C0Tw0g==";
      };
    };
    "sisteransi-1.0.5" = {
      name = "sisteransi";
      packageName = "sisteransi";
      version = "1.0.5";
      src = fetchurl {
        url = "https://registry.npmjs.org/sisteransi/-/sisteransi-1.0.5.tgz";
        sha512 = "bLGGlR1QxBcynn2d5YmDX4MGjlZvy2MRBDRNHLJ8VI6l6+9FUiyTFNJ0IveOSP0bcXgVDPRcfGqA0pjaqUpfVg==";
      };
    };
    "string-width-4.2.3" = {
      name = "string-width";
      packageName = "string-width";
      version = "4.2.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/string-width/-/string-width-4.2.3.tgz";
        sha512 = "wKyQRQpjJ0sIp62ErSZdGsjMJWsap5oRNihHhu6G7JVO/9jIB6UyevL+tXuOqrng8j/cxKTWyWUwvSTriiZz/g==";
      };
    };
    "strip-ansi-6.0.1" = {
      name = "strip-ansi";
      packageName = "strip-ansi";
      version = "6.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/strip-ansi/-/strip-ansi-6.0.1.tgz";
        sha512 = "Y38VPSHcqkFrCpFnQ9vuSXmquuv5oXOKpGeT6aGrr3o3Gc9AlVa6JBfUSOCnbxGGZF+/0ooI7KrPuUSztUdU5A==";
      };
    };
    "supports-color-7.2.0" = {
      name = "supports-color";
      packageName = "supports-color";
      version = "7.2.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/supports-color/-/supports-color-7.2.0.tgz";
        sha512 = "qpCAvRl9stuOHveKsn7HncJRvv501qIacKzQlO/+Lwxc9+0q2wLyv4Dfvt80/DPn2pqOBsJdDiogXGR9+OvwRw==";
      };
    };
    "tmp-0.2.1" = {
      name = "tmp";
      packageName = "tmp";
      version = "0.2.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/tmp/-/tmp-0.2.1.tgz";
        sha512 = "76SUhtfqR2Ijn+xllcI5P1oyannHNHByD80W1q447gU3mp9G9PSpGdWmjUOHRDPiHYacIk66W7ubDTuPF3BEtQ==";
      };
    };
    "tr46-0.0.3" = {
      name = "tr46";
      packageName = "tr46";
      version = "0.0.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/tr46/-/tr46-0.0.3.tgz";
        sha512 = "N3WMsuqV66lT30CrXNbEjx4GEwlow3v6rr4mCcv6prnfwhS01rkgyFdjPNBYd9br7LpXV1+Emh01fHnq2Gdgrw==";
      };
    };
    "universalify-2.0.0" = {
      name = "universalify";
      packageName = "universalify";
      version = "2.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/universalify/-/universalify-2.0.0.tgz";
        sha512 = "hAZsKq7Yy11Zu1DE0OzWjw7nnLZmJZYTDZZyEFHZdUhV8FkH5MCfoU1XMaxXovpyW5nq5scPqq0ZDP9Zyl04oQ==";
      };
    };
    "uuid-8.3.2" = {
      name = "uuid";
      packageName = "uuid";
      version = "8.3.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/uuid/-/uuid-8.3.2.tgz";
        sha512 = "+NYs2QeMWy+GWFOEm9xnn6HCDp0l7QBD7ml8zLUmJ+93Q5NF0NocErnwkTkXVFNiX3/fpC6afS8Dhb/gz7R7eg==";
      };
    };
    "vscode-jsonrpc-6.0.0" = {
      name = "vscode-jsonrpc";
      packageName = "vscode-jsonrpc";
      version = "6.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/vscode-jsonrpc/-/vscode-jsonrpc-6.0.0.tgz";
        sha512 = "wnJA4BnEjOSyFMvjZdpiOwhSq9uDoK8e/kpRJDTaMYzwlkrhG1fwDIZI94CLsLzlCK5cIbMMtFlJlfR57Lavmg==";
      };
    };
    "vscode-languageserver-7.0.0" = {
      name = "vscode-languageserver";
      packageName = "vscode-languageserver";
      version = "7.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/vscode-languageserver/-/vscode-languageserver-7.0.0.tgz";
        sha512 = "60HTx5ID+fLRcgdHfmz0LDZAXYEV68fzwG0JWwEPBode9NuMYTIxuYXPg4ngO8i8+Ou0lM7y6GzaYWbiDL0drw==";
      };
    };
    "vscode-languageserver-protocol-3.16.0" = {
      name = "vscode-languageserver-protocol";
      packageName = "vscode-languageserver-protocol";
      version = "3.16.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/vscode-languageserver-protocol/-/vscode-languageserver-protocol-3.16.0.tgz";
        sha512 = "sdeUoAawceQdgIfTI+sdcwkiK2KU+2cbEYA0agzM2uqaUy2UpnnGHtWTHVEtS0ES4zHU0eMFRGN+oQgDxlD66A==";
      };
    };
    "vscode-languageserver-textdocument-1.0.5" = {
      name = "vscode-languageserver-textdocument";
      packageName = "vscode-languageserver-textdocument";
      version = "1.0.5";
      src = fetchurl {
        url = "https://registry.npmjs.org/vscode-languageserver-textdocument/-/vscode-languageserver-textdocument-1.0.5.tgz";
        sha512 = "1ah7zyQjKBudnMiHbZmxz5bYNM9KKZYz+5VQLj+yr8l+9w3g+WAhCkUkWbhMEdC5u0ub4Ndiye/fDyS8ghIKQg==";
      };
    };
    "vscode-languageserver-types-3.16.0" = {
      name = "vscode-languageserver-types";
      packageName = "vscode-languageserver-types";
      version = "3.16.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/vscode-languageserver-types/-/vscode-languageserver-types-3.16.0.tgz";
        sha512 = "k8luDIWJWyenLc5ToFQQMaSrqCHiLwyKPHKPQZ5zz21vM+vIVUSvsRpcbiECH4WR88K2XZqc4ScRcZ7nk/jbeA==";
      };
    };
    "vscode-uri-3.0.3" = {
      name = "vscode-uri";
      packageName = "vscode-uri";
      version = "3.0.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/vscode-uri/-/vscode-uri-3.0.3.tgz";
        sha512 = "EcswR2S8bpR7fD0YPeS7r2xXExrScVMxg4MedACaWHEtx9ftCF/qHG1xGkolzTPcEmjTavCQgbVzHUIdTMzFGA==";
      };
    };
    "webidl-conversions-3.0.1" = {
      name = "webidl-conversions";
      packageName = "webidl-conversions";
      version = "3.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/webidl-conversions/-/webidl-conversions-3.0.1.tgz";
        sha512 = "2JAn3z8AR6rjK8Sm8orRC0h/bcl/DqL7tRPdGZ4I1CjdF+EaMLmYxBHyXuKL849eucPFhvBoxMsflfOb8kxaeQ==";
      };
    };
    "whatwg-fetch-3.6.2" = {
      name = "whatwg-fetch";
      packageName = "whatwg-fetch";
      version = "3.6.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/whatwg-fetch/-/whatwg-fetch-3.6.2.tgz";
        sha512 = "bJlen0FcuU/0EMLrdbJ7zOnW6ITZLrZMIarMUVmdKtsGvZna8vxKYaexICWPfZ8qwf9fzNq+UEIZrnSaApt6RA==";
      };
    };
    "whatwg-url-5.0.0" = {
      name = "whatwg-url";
      packageName = "whatwg-url";
      version = "5.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/whatwg-url/-/whatwg-url-5.0.0.tgz";
        sha512 = "saE57nupxk6v3HY35+jzBwYa0rKSy0XR8JSxZPwgLr7ys0IBzhGviA1/TUGJLmSVqs8pb9AnvICXEuOHLprYTw==";
      };
    };
    "wrap-ansi-7.0.0" = {
      name = "wrap-ansi";
      packageName = "wrap-ansi";
      version = "7.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/wrap-ansi/-/wrap-ansi-7.0.0.tgz";
        sha512 = "YVGIj2kamLSTxw6NsZjoBxfSwsn0ycdesmc4p+Q21c5zPuZ1pl+NfxVdxPtdHvmNVOQ6XSYG4AUtyt/Fi7D16Q==";
      };
    };
    "wrappy-1.0.2" = {
      name = "wrappy";
      packageName = "wrappy";
      version = "1.0.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/wrappy/-/wrappy-1.0.2.tgz";
        sha512 = "l4Sp/DRseor9wL6EvV2+TuQn63dMkPjZ/sp9XkghTEbV9KlPS1xUsZ3u7/IQO4wxtcFB4bgpQPRcR3QCvezPcQ==";
      };
    };
    "y18n-5.0.8" = {
      name = "y18n";
      packageName = "y18n";
      version = "5.0.8";
      src = fetchurl {
        url = "https://registry.npmjs.org/y18n/-/y18n-5.0.8.tgz";
        sha512 = "0pfFzegeDWJHJIAmTLRP2DwHjdF5s7jo9tuztdQxAhINCdvS+3nGINqPd00AphqJR/0LhANUS6/+7SCb98YOfA==";
      };
    };
    "yallist-4.0.0" = {
      name = "yallist";
      packageName = "yallist";
      version = "4.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/yallist/-/yallist-4.0.0.tgz";
        sha512 = "3wdGidZyq5PB084XLES5TpOSRA3wjXAlIWMhum2kRcv/41Sn2emQ0dycQW4uZXLejwKvg6EsvbdlVL+FYEct7A==";
      };
    };
    "yaml-1.10.2" = {
      name = "yaml";
      packageName = "yaml";
      version = "1.10.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/yaml/-/yaml-1.10.2.tgz";
        sha512 = "r3vXyErRCYJ7wg28yvBY5VSoAF8ZvlcW9/BwUzEtUsjvX/DKs24dIkuwjtuprwJJHsbyUbLApepYTR1BN4uHrg==";
      };
    };
    "yargs-17.5.1" = {
      name = "yargs";
      packageName = "yargs";
      version = "17.5.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/yargs/-/yargs-17.5.1.tgz";
        sha512 = "t6YAJcxDkNX7NFYiVtKvWUz8l+PaKTLiL63mJYWR2GnHq2gjEWISzsLp9wg3aY36dY1j+gfIEL3pIF+XlJJfbA==";
      };
    };
    "yargs-parser-21.0.1" = {
      name = "yargs-parser";
      packageName = "yargs-parser";
      version = "21.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/yargs-parser/-/yargs-parser-21.0.1.tgz";
        sha512 = "9BK1jFpLzJROCI5TzwZL/TU4gqjK5xiHV/RfWLOahrjAko/e4DJkRDZQXfvqAsiZzzYhgAzbgz6lg48jcm4GLg==";
      };
    };
  };
in
{
  "@ansible/ansible-language-server" = nodeEnv.buildNodePackage {
    name = "_at_ansible_slash_ansible-language-server";
    packageName = "@ansible/ansible-language-server";
    version = "0.9.0";
    src = fetchurl {
      url = "https://registry.npmjs.org/@ansible/ansible-language-server/-/ansible-language-server-0.9.0.tgz";
      sha512 = "CT5pHMndxE93K7uDWANfHPZWGMjRIUOt/jy5xahy+BVRnjLbc5KGRFGoLVN1bLfJ4S00qE8X936wY6HMoIBV1A==";
    };
    dependencies = [
      sources."@flatten-js/interval-tree-1.0.18"
      sources."balanced-match-1.0.2"
      sources."brace-expansion-2.0.1"
      sources."fs.realpath-1.0.0"
      sources."glob-8.0.3"
      sources."inflight-1.0.6"
      sources."inherits-2.0.4"
      sources."ini-3.0.0"
      sources."lodash-4.17.21"
      sources."minimatch-5.1.0"
      sources."once-1.4.0"
      sources."uuid-8.3.2"
      sources."vscode-jsonrpc-6.0.0"
      sources."vscode-languageserver-7.0.0"
      sources."vscode-languageserver-protocol-3.16.0"
      sources."vscode-languageserver-textdocument-1.0.5"
      sources."vscode-languageserver-types-3.16.0"
      sources."vscode-uri-3.0.3"
      sources."wrappy-1.0.2"
      sources."yaml-1.10.2"
    ];
    buildInputs = globalBuildInputs;
    meta = {
      description = "Ansible language server";
      homepage = "https://github.com/ansible/ansible-language-server#readme";
      license = "MIT";
    };
    production = true;
    bypassCache = true;
    reconstructLock = true;
  };
  "@withgraphite/graphite-cli" = nodeEnv.buildNodePackage {
    name = "_at_withgraphite_slash_graphite-cli";
    packageName = "@withgraphite/graphite-cli";
    version = "0.20.6";
    src = fetchurl {
      url = "https://registry.npmjs.org/@withgraphite/graphite-cli/-/graphite-cli-0.20.6.tgz";
      sha512 = "HX73RzmoCIMag2FyHohGm9iS+kRS1VpSZOmtuh5JSwTpU1ZiEoC+5CFVQQXiaACTLwkxLuwMuA4xxHxZmXDp8Q==";
    };
    dependencies = [
      sources."@withgraphite/graphite-cli-routes-0.22.0"
      sources."@withgraphite/retype-0.3.11"
      sources."@withgraphite/retyped-routes-0.3.2"
      sources."ansi-regex-5.0.1"
      sources."ansi-styles-4.3.0"
      sources."balanced-match-1.0.2"
      sources."brace-expansion-1.1.11"
      sources."chalk-4.1.2"
      sources."cliui-7.0.4"
      sources."color-convert-2.0.1"
      sources."color-name-1.1.4"
      sources."concat-map-0.0.1"
      sources."define-lazy-prop-2.0.0"
      sources."emoji-regex-8.0.0"
      sources."escalade-3.1.1"
      sources."fs-extra-10.1.0"
      sources."fs.realpath-1.0.0"
      sources."get-caller-file-2.0.5"
      sources."glob-7.2.3"
      sources."graceful-fs-4.2.10"
      sources."has-flag-4.0.0"
      sources."inflight-1.0.6"
      sources."inherits-2.0.4"
      sources."is-docker-2.2.1"
      sources."is-fullwidth-code-point-3.0.0"
      sources."is-wsl-2.2.0"
      sources."isomorphic-fetch-3.0.0"
      sources."jsonfile-6.1.0"
      sources."kleur-3.0.3"
      sources."lru-cache-6.0.0"
      sources."minimatch-3.1.2"
      sources."node-fetch-2.6.7"
      sources."once-1.4.0"
      sources."open-8.4.0"
      sources."path-is-absolute-1.0.1"
      sources."path-to-regexp-6.2.1"
      sources."prompts-2.4.2"
      sources."require-directory-2.1.1"
      sources."rimraf-3.0.2"
      sources."semver-7.3.7"
      sources."sisteransi-1.0.5"
      sources."string-width-4.2.3"
      sources."strip-ansi-6.0.1"
      sources."supports-color-7.2.0"
      sources."tmp-0.2.1"
      sources."tr46-0.0.3"
      sources."universalify-2.0.0"
      sources."webidl-conversions-3.0.1"
      sources."whatwg-fetch-3.6.2"
      sources."whatwg-url-5.0.0"
      sources."wrap-ansi-7.0.0"
      sources."wrappy-1.0.2"
      sources."y18n-5.0.8"
      sources."yallist-4.0.0"
      sources."yargs-17.5.1"
      sources."yargs-parser-21.0.1"
    ];
    buildInputs = globalBuildInputs;
    meta = {
      description = "[Graphite](https://graphite.dev) is a **fast, simple code review platform** designed for engineers who want to **write and review smaller pull requests, stay unblocked, and ship faster**.  Anyone can start using Graphite individually without needing their";
      homepage = "https://github.com/withgraphite/graphite-cli";
      license = "None";
    };
    production = true;
    bypassCache = true;
    reconstructLock = true;
  };
}
