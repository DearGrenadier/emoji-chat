window.app.factory('Sessions', (Restangular) ->
  sessions = Restangular.service('sessions')

  sessions.getSession = ->
    Restangular.all('sessions').customGET('show').$object

  return sessions
)
