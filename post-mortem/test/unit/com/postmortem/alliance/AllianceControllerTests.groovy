package com.postmortem.alliance



import org.junit.*
import grails.test.mixin.*

@TestFor(AllianceController)
@Mock(Alliance)
class AllianceControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/alliance/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.allianceInstanceList.size() == 0
        assert model.allianceInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.allianceInstance != null
    }

    void testSave() {
        controller.save()

        assert model.allianceInstance != null
        assert view == '/alliance/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/alliance/show/1'
        assert controller.flash.message != null
        assert Alliance.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/alliance/list'


        populateValidParams(params)
        def alliance = new Alliance(params)

        assert alliance.save() != null

        params.id = alliance.id

        def model = controller.show()

        assert model.allianceInstance == alliance
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/alliance/list'


        populateValidParams(params)
        def alliance = new Alliance(params)

        assert alliance.save() != null

        params.id = alliance.id

        def model = controller.edit()

        assert model.allianceInstance == alliance
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/alliance/list'

        response.reset()


        populateValidParams(params)
        def alliance = new Alliance(params)

        assert alliance.save() != null

        // test invalid parameters in update
        params.id = alliance.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/alliance/edit"
        assert model.allianceInstance != null

        alliance.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/alliance/show/$alliance.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        alliance.clearErrors()

        populateValidParams(params)
        params.id = alliance.id
        params.version = -1
        controller.update()

        assert view == "/alliance/edit"
        assert model.allianceInstance != null
        assert model.allianceInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/alliance/list'

        response.reset()

        populateValidParams(params)
        def alliance = new Alliance(params)

        assert alliance.save() != null
        assert Alliance.count() == 1

        params.id = alliance.id

        controller.delete()

        assert Alliance.count() == 0
        assert Alliance.get(alliance.id) == null
        assert response.redirectedUrl == '/alliance/list'
    }
}
