angular.module('demandsApp').filter('truncate', function () {

    return function (content, maxCharacters) {

        if (content == null) return "";

        content = "" + content;

        content = content.trim();

        if (content.length <= maxCharacters) return content;

        content = content.substring(0, maxCharacters);

        var lastSpace = content.lastIndexOf(" ");

        if (lastSpace > -1) content = content.substr(0, lastSpace);

        return content + '...';
    };
});
