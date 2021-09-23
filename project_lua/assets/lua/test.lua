function app()
	return Row:new({
        MainAxisAlignment.center
		children = {
			Text:new("Flutter", {
				style = {
					fontSize = sp(100),
					fontWeight = FontWeight.w200
				}
			}),
			Text:new("Flutter1", {
				style = {
					fontSize = sp(100),
					fontWeight = FontWeight.w200
				}
			}),
			Text:new("Flutter2", {
				style = {
					fontSize = sp(200),
					fontWeight = FontWeight.w800
				}
			})
		}
	});
end;





print("hello world");
