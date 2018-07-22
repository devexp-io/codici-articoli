import { TestBed, inject } from '@angular/core/testing';

import { AwaitHttpClientService } from './await-http-client.service';

describe('AwaitHttpClientService', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [AwaitHttpClientService]
    });
  });

  it('should be created', inject([AwaitHttpClientService], (service: AwaitHttpClientService) => {
    expect(service).toBeTruthy();
  }));
});
