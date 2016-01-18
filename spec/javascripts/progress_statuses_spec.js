describe("A progress bar", function() {

	var progress_bar;
	beforeEach(function() {
		jasmine.Ajax.install();
		progress_bar = new ProgressBar('#bar', 'x', 'y');
	});

	afterEach(function() {
		jasmine.Ajax.uninstall();
	});

	describe("#start", function() {

		var barElement;
		beforeEach(function() {
			jasmine.getFixtures().fixturesPath = 'base/spec/javascripts/fixtures/';
			loadFixtures('progress-bar.html');
			barElement = $('#bar').find('.progress-bar');
			progress_bar.start();
		});

		it("calls given url", function() {
			expect(jasmine.Ajax.requests.mostRecent().url).toBe('x');

		});

		it("increases bar width", function() {
			jasmine.Ajax.requests.mostRecent().respondWith({
				"status": 200,
				"contentType": 'json',
				"responseText": '{"percent": "10"}'
			});
			expect(barElement.width()).toBe(10);
		});

		it("fetches result", function() {
			jasmine.Ajax.requests.mostRecent().respondWith({
				"status": 200,
				"contentType": 'json',
				"responseText": '{"percent": "100"}'
			});
			expect(jasmine.Ajax.requests.mostRecent().url).toBe('y');
		});

		describe("shows result", function() {

			beforeEach(function() {
				console.log("before"+jasmine.Ajax.requests);
				jasmine.Ajax.requests.mostRecent().respondWith({
					"status": 200,
					"contentType": 'json',
					"responseText": '{"percent": "100"}'
				});
				console.log("after"+jasmine.Ajax.requests.mostRecent());
			});

			it("on completion", function() {
				console.log("inside"+jasmine.Ajax.requests);
				jasmine.Ajax.requests.mostRecent().respondWith({
					"status": 200,
					"contentType": 'html',
					"responseText": '<div>response</div>'
				});
				expect($('body').html()).toContain('response');
			});
		});
	});
});
