describe("A progress bar", function() {

	var progressBar;
	beforeEach(function() {
    setFixtures('<div id="bar" data-ping-time="1000"><div class="progress-bar" style="width: 0%;">0%</div></div>');
		jasmine.Ajax.install();
		progressBar = new ProgressBar('#bar', 'x', 'y', 'z');
	});

	afterEach(function() {
		jasmine.Ajax.uninstall();
	});

	describe("#start", function() {

		var barElement;
		beforeEach(function() {
			// jasmine.getFixtures().fixturesPath = 'base/spec/javascripts/fixtures/';
			// loadFixtures('progress-bar.html');
			barElement = $('#bar').find('.progress-bar');

			progressBar.start();
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

			expect(barElement.width()).toBe(Math.round(barElement.parent().width()*10/100));
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
				jasmine.Ajax.requests.mostRecent().respondWith({
					"status": 200,
					"contentType": 'json',
					"responseText": '{"percent": "100"}'
				});
			});

			it("on completion", function() {
				jasmine.Ajax.requests.mostRecent().respondWith({
					"status": 200,
					"contentType": 'html',
					"responseText": '$("body").html("<div>response</div>")'
				});
				expect($('body').html()).toContain('response');
			});
		});
	});
});
